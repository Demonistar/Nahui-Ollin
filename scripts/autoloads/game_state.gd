extends Node

# ============================================================
# GAME STATE — Single source of truth for all game data
# Source: Build Bible v1 Section 2.2
# Every system reads from and writes to this autoload.
# ============================================================

var screen: String = 'title'

var hero := {
	'name': '',
	'gender': 'male',
	'level': 1,
	'xp': 0,
	'xp_to_next': 100,
	'hp': 100,
	'max_hp': 100,
	'class1': '',
	'class2': '',
	'evolution_title': '',
	'skill_points': 0,
	'skills_spent': {},
	'patron': '',
	'stats': {
		'attack': 10,
		'attack_speed': 1.0,
		'attack_range': 2,
		'move_speed': 1,
		'harvest_speed': 1.0,
	},
	'active_buffs': [],
}

var inventory := {
	'ingredients': {},
	'wood': 0,
	'stone': 0,
	'copper': 0,
	'iron': 0,
	'hardwood': 0,
	'fiber': 0,
	'currency': 0,
	'fragments': {},
	'cooked_food': {},
	'capacity': 50,
}

var progression := {
	'missions_completed': 0,
	'missions_lost': 0,
	'total_ascensions': 0,
	'highest_level': 0,
	'consecutive_wins': 0,
	'best_kills': 0,
	'unlocked_recipes': [],
	'encyclopedia_unlocked': [],
	'encyclopedia_favorites': [],
	'current_run_quest_points': 10,
	'quest_progress': {},
	'god_persuasion': {},
	'whisper_used': false,
	'blessings': [],
	'prologue_complete': false,
	'first_meal_eaten': false,
}

var meta := {
	'ascension_points': 0,
	'incremental_nodes': {},
	'built_stations': [],
	'map_expansions': {'north': 0, 'south': 0, 'east': 0, 'west': 0},
	'upgrades': {
		'extra_time': 0,
		'bonus_hp': 0,
		'harvest_bonus': false,
		'xp_bonus': false,
		'rare_bonus': false,
		'death_savings': false,
		'whisper_of_mirror': false,
		'ancient_trade_routes': false,
		'veterans_memory': false,
		'the_long_view': false,
	},
}

var mission := {
	'active': false,
	'is_prologue': false,
	'seed': 0,
	'time_remaining': 90.0,
	'wave': 0,
	'enemies_killed': 0,
	'resources_collected': {},
	'currency_earned': 0,
	'xp_earned': 0,
	'total_harvested': 0,
	'total_damage_taken': 0,
	'unique_tiles_harvested': [],
	'kills_by_type': {},
	'no_ability_kills': 0,
	'buffs_used': false,
	'currency_collected': 0,
}


func get_grid_size() -> int:
	var base = GameConfig.GRID_SIZE_START
	base += meta.map_expansions.north * 4
	base += meta.map_expansions.south * 4
	return min(base, GameConfig.GRID_SIZE_MAX)
