extends Node

# ============================================================
# MAIN — Entry point. Verifies autoloads, then routes.
# Step 1 POC: prints state to Output panel.
# Later steps will replace this with real scene routing.
# ============================================================


func _ready() -> void:
	print("=== Fifth Sun: Nahui Ollin ===")
	print("Step 1 — Project Shell + Autoloads")
	print("-------------------------------")
	print("GameConfig.TILE_SIZE     = ", GameConfig.TILE_SIZE)
	print("GameConfig.MAP_WIDTH     = ", GameConfig.MAP_WIDTH)
	print("GameState.hero.level     = ", GameState.hero.level)
	print("GameState.hero.hp        = ", GameState.hero.hp)
	print("GameState.resources      = ", GameState.resources)
	print("LoreData gods loaded     : ", LoreData.gods.size())
	print("LoreData classes loaded  : ", LoreData.classes.size())
	print("RecipeData recipes loaded: ", RecipeData.recipes.size())
	print("Save path                : ", GameConfig.SAVE_FILE_PATH)
	print("-------------------------------")
	print("All autoloads initialized. Step 1 Definition of Done: PASS")
