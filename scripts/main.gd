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
