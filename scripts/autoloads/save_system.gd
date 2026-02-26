extends Node

# ============================================================
# SAVE SYSTEM — Persistent save/load via JSON with deep merge
# Source: Build Bible Section 2.3
# Save file location: user://fifth_sun_save.json
# ============================================================


func _ready() -> void:
	load_game()


func save_game() -> void:
	var save_data: Dictionary = {
		"version": GameConfig.SAVE_VERSION,
		"hero": GameState.hero.duplicate(true),
		"resources": GameState.resources.duplicate(true),
		"inventory": GameState.inventory.duplicate(true),
		"hub": GameState.hub.duplicate(true),
		"recipes_unlocked": GameState.recipes_unlocked.duplicate(true),
		"quests": GameState.quests.duplicate(true),
		"skills": GameState.skills.duplicate(true),
		"god": GameState.god.duplicate(true),
		"meta": GameState.meta.duplicate(true),
	}
	var file: FileAccess = FileAccess.open(GameConfig.SAVE_FILE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(save_data, "\t"))
		file.close()
	else:
		push_error("SaveSystem: Failed to open save file for writing: " + GameConfig.SAVE_FILE_PATH)


func load_game() -> void:
	if not FileAccess.file_exists(GameConfig.SAVE_FILE_PATH):
		return
	var file: FileAccess = FileAccess.open(GameConfig.SAVE_FILE_PATH, FileAccess.READ)
	if not file:
		push_error("SaveSystem: Failed to open save file for reading: " + GameConfig.SAVE_FILE_PATH)
		return
	var json_string: String = file.get_as_text()
	file.close()
	var json: JSON = JSON.new()
	var error: int = json.parse(json_string)
	if error != OK:
		push_error("SaveSystem: JSON parse error at line " + str(json.get_error_line()) + ": " + json.get_error_message())
		return
	var data = json.get_data()
	if typeof(data) != TYPE_DICTIONARY:
		push_error("SaveSystem: Save data is not a dictionary.")
		return
	_apply_save_data(data)


func _apply_save_data(data: Dictionary) -> void:
	if data.has("hero"):
		_deep_merge(GameState.hero, data["hero"])
	if data.has("resources"):
		_deep_merge(GameState.resources, data["resources"])
	if data.has("inventory"):
		GameState.inventory = data["inventory"].duplicate(true)
	if data.has("hub"):
		_deep_merge(GameState.hub, data["hub"])
	if data.has("recipes_unlocked"):
		GameState.recipes_unlocked = data["recipes_unlocked"].duplicate(true)
	if data.has("quests"):
		_deep_merge(GameState.quests, data["quests"])
	if data.has("skills"):
		_deep_merge(GameState.skills, data["skills"])
	if data.has("god"):
		_deep_merge(GameState.god, data["god"])
	if data.has("meta"):
		_deep_merge(GameState.meta, data["meta"])


func _deep_merge(target: Dictionary, source: Dictionary) -> void:
	for key in source:
		if key in target \
				and typeof(target[key]) == TYPE_DICTIONARY \
				and typeof(source[key]) == TYPE_DICTIONARY:
			_deep_merge(target[key], source[key])
		else:
			target[key] = source[key]


func delete_save() -> void:
	if FileAccess.file_exists(GameConfig.SAVE_FILE_PATH):
		var absolute_path: String = ProjectSettings.globalize_path(GameConfig.SAVE_FILE_PATH)
		DirAccess.remove_absolute(absolute_path)
