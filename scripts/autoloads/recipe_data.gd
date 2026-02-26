extends Node

# ============================================================
# RECIPE DATA — All recipes and encyclopedia entries
# Source: Master GDD v1 + Lore Bible v2
# ============================================================

enum RecipeCategory { FOOD, TOOL, STRUCTURE, OFFERING }

# Each recipe: id, nahuatl_name, name, category,
#              ingredients (resource_id -> amount),
#              result, result_amount,
#              description, encyclopedia_entry,
#              station_required, unlock_condition
var recipes: Dictionary = {
	# --- FOOD ---
	"tortilla": {
		"id": "tortilla",
		"name": "Tortilla",
		"nahuatl_name": "Tlaxcalli",
		"category": RecipeCategory.FOOD,
		"ingredients": { "ingredients": 2 },
		"result": "tortilla",
		"result_amount": 1,
		"hp_restore": 25,
		"hunger_restore": 40,
		"description": "The foundation of Mesoamerican diet. Prepared from masa on a comal.",
		"encyclopedia_entry": "Tlaxcalli (tortilla) is made from nixtamalized maize. An essential food for warriors and farmers alike. The comal used to cook it was considered sacred.",
		"station_required": "firepit",
		"unlock_condition": "default",
	},
	"tamale": {
		"id": "tamale",
		"name": "Tamale",
		"nahuatl_name": "Tamalli",
		"category": RecipeCategory.FOOD,
		"ingredients": { "ingredients": 3, "wood": 1 },
		"result": "tamale",
		"result_amount": 2,
		"hp_restore": 40,
		"hunger_restore": 60,
		"description": "Steamed masa dough with fillings, wrapped in husks. A festive food.",
		"encyclopedia_entry": "Tamalli were made for festivals and sent with soldiers as portable sustenance. Prepared in large numbers during ceremonies.",
		"station_required": "firepit",
		"unlock_condition": "level_3",
	},
	"atole": {
		"id": "atole",
		"name": "Atole",
		"nahuatl_name": "Atolli",
		"category": RecipeCategory.FOOD,
		"ingredients": { "ingredients": 2, "cacao": 1 },
		"result": "atole",
		"result_amount": 1,
		"hp_restore": 15,
		"hunger_restore": 50,
		"description": "A warm maize-based drink, sometimes flavored with cacao.",
		"encyclopedia_entry": "Atolli was consumed daily across all social classes. Cacao-flavored varieties were prized by the nobility.",
		"station_required": "firepit",
		"unlock_condition": "unlock_cacao",
	},
	"cacao_drink": {
		"id": "cacao_drink",
		"name": "Cacao Drink",
		"nahuatl_name": "Cacahuatl",
		"category": RecipeCategory.FOOD,
		"ingredients": { "cacao": 3 },
		"result": "cacao_drink",
		"result_amount": 1,
		"hp_restore": 30,
		"hunger_restore": 20,
		"description": "A precious drink made from ground cacao beans. Said to strengthen the connection with the divine.",
		"encyclopedia_entry": "Cacahuatl was consumed by warriors before battle and priests before ceremony. Cacao beans also served as currency.",
		"station_required": "firepit",
		"unlock_condition": "unlock_cacao",
		"bonus_effect": "god_awareness_5",
	},
	"dried_meat": {
		"id": "dried_meat",
		"name": "Dried Meat",
		"nahuatl_name": "Cuahnacatl",
		"category": RecipeCategory.FOOD,
		"ingredients": { "meat": 3, "wood": 1 },
		"result": "dried_meat",
		"result_amount": 2,
		"hp_restore": 20,
		"hunger_restore": 35,
		"description": "Preserved meat for long journeys. Lasts through multiple missions.",
		"encyclopedia_entry": "Game was preserved by drying to sustain warriors on campaign. The process extended shelf life and reduced weight carried.",
		"station_required": "firepit",
		"unlock_condition": "level_2",
	},
	# --- TOOLS ---
	"stone_blade": {
		"id": "stone_blade",
		"name": "Obsidian Blade",
		"nahuatl_name": "Itztli",
		"category": RecipeCategory.TOOL,
		"ingredients": { "stone": 5 },
		"result": "stone_blade",
		"result_amount": 1,
		"description": "A razor-sharp obsidian blade. Increases attack power.",
		"encyclopedia_entry": "Itztli (obsidian) produced the sharpest edges known. Obsidian blades were used in weapons, surgery, and ritual sacrifice.",
		"stat_bonus": { "attack": 5 },
		"station_required": "workshop",
		"unlock_condition": "default",
	},
	"wooden_shield": {
		"id": "wooden_shield",
		"name": "Wooden Shield",
		"nahuatl_name": "Chimalli",
		"category": RecipeCategory.TOOL,
		"ingredients": { "wood": 5 },
		"result": "wooden_shield",
		"result_amount": 1,
		"description": "A basic chimalli that increases defense.",
		"encyclopedia_entry": "The chimalli was the primary defensive weapon. Decorated with feathers and paint, shields denoted rank and divine patronage.",
		"stat_bonus": { "defense": 5 },
		"station_required": "workshop",
		"unlock_condition": "default",
	},
	# --- STRUCTURES ---
	"firepit": {
		"id": "firepit",
		"name": "Firepit",
		"nahuatl_name": "Tlecuilli",
		"category": RecipeCategory.STRUCTURE,
		"ingredients": { "wood": 5, "stone": 3 },
		"result": "firepit",
		"result_amount": 1,
		"description": "The hearth of the camp. Required for cooking all food recipes.",
		"encyclopedia_entry": "The tlecuilli (hearth) was the spiritual center of Mexica domestic life. Sacred fire, once lit in ceremony, was never extinguished during festivals.",
		"station_required": "",
		"unlock_condition": "prologue",
	},
	"workshop": {
		"id": "workshop",
		"name": "Workshop",
		"nahuatl_name": "Toltecayotl",
		"category": RecipeCategory.STRUCTURE,
		"ingredients": { "wood": 8, "stone": 5 },
		"result": "workshop",
		"result_amount": 1,
		"description": "A crafting station for tools and weapons.",
		"encyclopedia_entry": "Toltec craftsmanship (toltecayotl) was synonymous with skill and artistry. The word Toltec came to mean 'skilled artisan.'",
		"station_required": "",
		"unlock_condition": "level_2",
	},
}

# Favorites (runtime + saved via GameState)
var favorites: Array = []


func get_recipe(recipe_id: String) -> Dictionary:
	return recipes.get(recipe_id, {})


func get_all_recipes() -> Array:
	return recipes.values()


func get_recipes_by_category(category: RecipeCategory) -> Array:
	return recipes.values().filter(func(r): return r.category == category)


func get_unlocked_recipes() -> Array:
	return recipes.values().filter(
		func(r): return r.id in GameState.recipes_unlocked
	)


func can_craft(recipe_id: String) -> bool:
	var recipe: Dictionary = get_recipe(recipe_id)
	if recipe.is_empty():
		return false
	for resource_id in recipe.get("ingredients", {}):
		if not GameState.has_resource(resource_id, recipe.ingredients[resource_id]):
			return false
	return true


func toggle_favorite(recipe_id: String) -> void:
	if recipe_id in favorites:
		favorites.erase(recipe_id)
	else:
		favorites.append(recipe_id)


func is_favorite(recipe_id: String) -> bool:
	return recipe_id in favorites
