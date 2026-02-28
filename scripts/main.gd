extends Node

# ============================================================
# MAIN — Entry point. Step 2: TileMap + Map Generation.
# Step 1 autoload verification retained.
# Step 2 loads tilemap scene, generates map with seed 12345,
# renders it, and verifies different seed produces different map.
# ============================================================


func _ready() -> void:
	print("=== Fifth Sun: Nahui Ollin ===")
	print("Step 1 — Project Shell + Autoloads")
	print("-------------------------------")
	print("GameConfig.TILE_SIZE_PX  = ", GameConfig.TILE_SIZE_PX)
	print("GameConfig.GRID_SIZE_START = ", GameConfig.GRID_SIZE_START)
	print("GameState.hero.level     = ", GameState.hero.level)
	print("GameState.hero.hp        = ", GameState.hero.hp)
	print("LoreData gods loaded     : ", LoreData.GODS.size())
	print("LoreData classes loaded  : ", LoreData.CLASSES.size())
	print("RecipeData recipes loaded: ", RecipeData.RECIPES.size())
	print("Save path                : ", 'user://fifth_sun_save.json')
	print("-------------------------------")
	print("All autoloads initialized. Step 1 Definition of Done: PASS")
	print("")
	print("Step 2 — TileMap + Map Generation")
	print("-------------------------------")

	var grid_size: int = GameConfig.GRID_SIZE_START

	# Generate map A with seed 12345
	var map_a: Array = MapGenerator.generate_map(grid_size, 12345, 1)
	var a_resources := _count_resources(map_a, grid_size)
	print("Map A (seed 12345) resource nodes : ", a_resources)

	# Generate map B with seed 99999 — must differ
	var map_b: Array = MapGenerator.generate_map(grid_size, 99999, 1)
	var b_resources := _count_resources(map_b, grid_size)
	print("Map B (seed 99999) resource nodes : ", b_resources)

	var maps_differ := _maps_differ(map_a, map_b, grid_size)
	print("Different seeds produce different maps: ", maps_differ)
	print("-------------------------------")

	if maps_differ and a_resources > 0:
		print("Step 2 Definition of Done: PASS")
	else:
		print("Step 2 Definition of Done: FAIL — check generator")

	# Load and display tilemap scene with map A.
	# add_child and render are both deferred so the tilemap node enters the
	# scene tree first (firing _ready and resolving @onready vars) before
	# render() accesses _tile_container and _camera.
	var tilemap_scene: PackedScene = load("res://scenes/mission/tilemap.tscn")
	if tilemap_scene:
		var tilemap: Node = tilemap_scene.instantiate()
		get_tree().root.call_deferred("add_child", tilemap)
		tilemap.call_deferred("render", map_a)
		GameState.screen = "tilemap"
	else:
		print("ERROR: could not load tilemap.tscn")


func _count_resources(map: Array, grid_size: int) -> int:
	var count := 0
	for y in range(grid_size):
		for x in range(grid_size):
			if map[y][x].resource != null:
				count += 1
	return count


func _maps_differ(map_a: Array, map_b: Array, grid_size: int) -> bool:
	for y in range(grid_size):
		for x in range(grid_size):
			if map_a[y][x].ground != map_b[y][x].ground:
				return true
			if map_a[y][x].resource != map_b[y][x].resource:
				return true
	return false
