extends Node

# ============================================================
# SAVE SYSTEM — Persistent save/load via JSON with deep merge
# Source: Build Bible v1 Section 2.3
# ============================================================

const SAVE_PATH = 'user://fifth_sun_save.json'


func save_game() -> void:
	var data = {
		'hero': GameState.hero,
		'inventory': GameState.inventory,
		'progression': GameState.progression,
		'meta': GameState.meta,
	}
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	file.store_string(JSON.stringify(data, '\t'))
	file.close()


func load_game() -> bool:
	if not FileAccess.file_exists(SAVE_PATH): return false
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	var json = JSON.new()
	var err = json.parse(file.get_as_text())
	file.close()
	if err != OK: return false
	var data = json.get_data()
	_deep_merge(GameState.hero, data.get('hero', {}))
	_deep_merge(GameState.inventory, data.get('inventory', {}))
	_deep_merge(GameState.progression, data.get('progression', {}))
	_deep_merge(GameState.meta, data.get('meta', {}))
	return true


func _deep_merge(target: Dictionary, source: Dictionary) -> void:
	for key in source:
		if key in target and typeof(target[key]) == TYPE_DICTIONARY:
			_deep_merge(target[key], source[key])
		else:
			target[key] = source[key]
