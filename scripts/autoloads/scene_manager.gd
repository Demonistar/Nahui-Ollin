extends Node

# ============================================================
# SCENE MANAGER — Scene transitions and routing
# Source: Build Bible Section 9.1
# ============================================================

signal scene_changed(scene_path: String)

var _current_scene: String = ""
var _transition_in_progress: bool = false


func _ready() -> void:
	_current_scene = GameConfig.SCENE_MAIN


func go_to_scene(scene_path: String) -> void:
	if _transition_in_progress:
		return
	_transition_in_progress = true
	_current_scene = scene_path
	get_tree().change_scene_to_file(scene_path)
	_transition_in_progress = false
	emit_signal("scene_changed", scene_path)


func go_to_prologue() -> void:
	GameState.session.in_prologue = true
	GameState.session.in_mission = false
	GameState.session.in_hub = false
	go_to_scene(GameConfig.SCENE_PROLOGUE)


func go_to_hub() -> void:
	GameState.session.in_prologue = false
	GameState.session.in_mission = false
	GameState.session.in_hub = true
	SaveSystem.save_game()
	go_to_scene(GameConfig.SCENE_HUB)


func go_to_mission() -> void:
	GameState.session.in_prologue = false
	GameState.session.in_hub = false
	GameState.session.in_mission = true
	GameState.reset_for_new_mission()
	go_to_scene(GameConfig.SCENE_MISSION)


func go_to_council() -> void:
	go_to_scene(GameConfig.SCENE_COUNCIL)


func go_to_reckoning() -> void:
	go_to_scene(GameConfig.SCENE_RECKONING)


func go_to_naming_ceremony() -> void:
	go_to_scene(GameConfig.SCENE_NAMING)


func go_to_character_select() -> void:
	go_to_scene(GameConfig.SCENE_CHARACTER_SELECT)


func reload_current_scene() -> void:
	get_tree().reload_current_scene()


func get_current_scene() -> String:
	return _current_scene
