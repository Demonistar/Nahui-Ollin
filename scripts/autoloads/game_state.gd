extends Node

# ============================================================
# GAME STATE — All runtime state and save data
# Source: Build Bible Section 2.2
# ============================================================

signal state_changed
signal hero_level_changed(new_level: int)
signal hero_hp_changed(new_hp: int, max_hp: int)
signal resources_changed
signal quest_updated

# --- HERO ---
var hero: Dictionary = {
	"name": "",
	"gender": "male",
	"class_id": "",
	"patron_id": "",
	"level": 1,
	"xp": 0,
	"xp_to_next": 100,
	"hp": 100,
	"max_hp": 100,
	"attack": 10,
	"defense": 5,
	"speed": 1,
	"hunger": 100,
	"gold": 0,
}

# --- RESOURCES (shared pool, persists between missions) ---
var resources: Dictionary = {
	"wood": 0,
	"stone": 0,
	"meat": 0,
	"ingredients": 0,
	"cacao": 0,
}

# --- INVENTORY (items carried into mission) ---
var inventory: Array = []

# --- HUB STATE ---
var hub: Dictionary = {
	"firepit_built": false,
	"stations": {},      # station_id -> {level: int, unlocked: bool}
	"upgrades": {},      # upgrade_id -> bool
}

# --- RECIPES ---
var recipes_unlocked: Array = ["tortilla"]   # tortilla unlocked by default

# --- QUESTS ---
var quests: Dictionary = {
	"active_quest_id": "",
	"completed_quest_ids": [],
	"points": 3,         # Council quest points available
	"tracking": {},      # criteria_id -> current_value (this mission)
}

# --- SKILL TREE ---
var skills: Dictionary = {
	"purchased": [],
	"ap": 0,             # Ascension Points available to spend
}

# --- GOD SYSTEM ---
var god: Dictionary = {
	"patron_id": "",
	"awareness": 0,
	"offerings": {},     # resource_id -> total amount offered this run
	"sacrifice_attempted": false,
}

# --- META-PROGRESSION (persists across ascensions) ---
var meta: Dictionary = {
	"ascension_count": 0,
	"ap_total": 0,
	"meta_upgrades": [],
	"heroes_named": [],   # list of {name, class_id, level, ascension} from past runs
	"best_mission_count": 0,
}

# --- SESSION (runtime only — not saved) ---
var session: Dictionary = {
	"mission_number": 0,
	"in_prologue": false,
	"in_mission": false,
	"in_hub": false,
	"mission_resources_gained": {},   # resources gained this mission (for death penalty)
}


func gain_xp(amount: int) -> void:
	hero.xp += amount
	while hero.xp >= hero.xp_to_next and hero.level < GameConfig.HERO_MAX_LEVEL:
		hero.xp -= hero.xp_to_next
		_level_up()
	emit_signal("state_changed")


func _level_up() -> void:
	hero.level += 1
	hero.xp_to_next = int(GameConfig.HERO_XP_BASE * pow(GameConfig.HERO_XP_SCALE, hero.level - 1))
	hero.max_hp += 10
	hero.hp = hero.max_hp
	hero.attack += 2
	hero.defense += 1
	emit_signal("hero_level_changed", hero.level)


func add_resource(resource_id: String, amount: int) -> void:
	if resource_id in resources:
		resources[resource_id] += amount
		session.mission_resources_gained[resource_id] = \
			session.mission_resources_gained.get(resource_id, 0) + amount
		emit_signal("resources_changed")


func remove_resource(resource_id: String, amount: int) -> bool:
	if resource_id in resources and resources[resource_id] >= amount:
		resources[resource_id] -= amount
		emit_signal("resources_changed")
		return true
	return false


func has_resource(resource_id: String, amount: int) -> bool:
	return resources.get(resource_id, 0) >= amount


func take_damage(amount: int) -> void:
	hero.hp = max(0, hero.hp - amount)
	emit_signal("hero_hp_changed", hero.hp, hero.max_hp)


func heal(amount: int) -> void:
	hero.hp = min(hero.max_hp, hero.hp + amount)
	emit_signal("hero_hp_changed", hero.hp, hero.max_hp)


func apply_death_penalty() -> void:
	for resource_id in session.mission_resources_gained:
		var gained: int = session.mission_resources_gained[resource_id]
		var keep: int = int(gained * GameConfig.DEATH_RESOURCE_KEEP)
		var lose: int = gained - keep
		resources[resource_id] = max(0, resources.get(resource_id, 0) - lose)
	emit_signal("resources_changed")


func reset_for_new_mission() -> void:
	session.mission_resources_gained = {}
	session.mission_number += 1
	quests.tracking = {}


func ascend() -> void:
	var ap: int = _calculate_ap()
	meta.ap_total += ap
	meta.ascension_count += 1
	if hero.name != "":
		meta.heroes_named.append({
			"name": hero.name,
			"class_id": hero.class_id,
			"level": hero.level,
			"ascension": meta.ascension_count,
		})
	if session.mission_number > meta.best_mission_count:
		meta.best_mission_count = session.mission_number
	_reset_run()
	SaveSystem.save_game()


func _calculate_ap() -> int:
	return hero.level * 2 + session.mission_number


func _reset_run() -> void:
	var saved_gender: String = hero.gender
	hero = {
		"name": "",
		"gender": saved_gender,
		"class_id": "",
		"patron_id": "",
		"level": 1,
		"xp": 0,
		"xp_to_next": 100,
		"hp": 100,
		"max_hp": 100,
		"attack": 10,
		"defense": 5,
		"speed": 1,
		"hunger": 100,
		"gold": 0,
	}
	resources = { "wood": 0, "stone": 0, "meat": 0, "ingredients": 0, "cacao": 0 }
	inventory = []
	recipes_unlocked = ["tortilla"]
	quests = {
		"active_quest_id": "",
		"completed_quest_ids": [],
		"points": GameConfig.QUEST_POINTS_START,
		"tracking": {},
	}
	skills = { "purchased": [], "ap": meta.ap_total }
	god = { "patron_id": "", "awareness": 0, "offerings": {}, "sacrifice_attempted": false }
	session = {
		"mission_number": 0,
		"in_prologue": false,
		"in_mission": false,
		"in_hub": false,
		"mission_resources_gained": {},
	}
