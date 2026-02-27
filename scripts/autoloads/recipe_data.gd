extends Node

# ============================================================
# RECIPE DATA — All in-game recipes and encyclopedia entries
# Source: Master GDD v1 Sections 2.3, 4.3, 4.4, 11.2, 11.3
# Session Guide Rule 2: Never invent lore.
# ============================================================

# --- IN-GAME RECIPES ---
# Source: GDD Section 2.3 (Tortilla), GDD Section 11.3 (all others)
# cook_time: seconds — referenced by cook_system.gd (Build Bible Section 8.1)
# wood_cost: 1-3 per GDD Section 4.4 ("each cook operation costs 1-3 Wood")
# ingredients: GDD Section 2.3 specifies Tortilla only. All others stubbed —
#              full ingredient lists to be specified in Build Step 10 (Hub).
const RECIPES := {
	"tortilla": {
		"id": "tortilla",
		"display_name": "Tortilla",
		"ingredients": {"corn": 2, "water": 1},
		"wood_cost": 1,
		"cook_time": 30.0,
		"station_required": "firepit",
		"encyclopedia_key": "",
	},
	# GDD Section 11.3 — named in-game recipes linked to encyclopedia entries.
	# Ingredient lists not specified in documents. Stubbed until Build Step 10.
	"shadowherb_broth": {
		"id": "shadowherb_broth",
		"display_name": "Shadowherb Broth",
		"ingredients": {},
		"wood_cost": 1,
		"cook_time": 30.0,
		"station_required": "firepit",
		"encyclopedia_key": "sopa_de_hierbas",
	},
	"salted_darkfruit": {
		"id": "salted_darkfruit",
		"display_name": "Salted Darkfruit",
		"ingredients": {},
		"wood_cost": 1,
		"cook_time": 30.0,
		"station_required": "firepit",
		"encyclopedia_key": "frutas_con_chile_y_sal",
	},
	"pale_fish_stew": {
		"id": "pale_fish_stew",
		"display_name": "Pale Fish Stew",
		"ingredients": {},
		"wood_cost": 1,
		"cook_time": 30.0,
		"station_required": "firepit",
		"encyclopedia_key": "caldo_de_pescado",
	},
	"bone_broth": {
		"id": "bone_broth",
		"display_name": "Bone Broth",
		"ingredients": {},
		"wood_cost": 1,
		"cook_time": 30.0,
		"station_required": "firepit",
		"encyclopedia_key": "caldo_de_hueso",
	},
	"cursed_mushroom_soup": {
		"id": "cursed_mushroom_soup",
		"display_name": "Cursed Mushroom Soup",
		"ingredients": {},
		"wood_cost": 1,
		"cook_time": 30.0,
		"station_required": "firepit",
		"encyclopedia_key": "sopa_de_hongos_silvestres",
	},
	"hunters_feast": {
		"id": "hunters_feast",
		"display_name": "Hunter's Feast",
		"ingredients": {},
		"wood_cost": 2,
		"cook_time": 30.0,
		"station_required": "firepit",
		"encyclopedia_key": "festin_del_cazador",
	},
	"witchs_preserve": {
		"id": "witchs_preserve",
		"display_name": "Witch's Preserve",
		"ingredients": {},
		"wood_cost": 1,
		"cook_time": 30.0,
		"station_required": "firepit",
		"encyclopedia_key": "conserva_de_la_bruja",
	},
	"iron_ration": {
		"id": "iron_ration",
		"display_name": "Iron Ration",
		"ingredients": {},
		"wood_cost": 1,
		"cook_time": 30.0,
		"station_required": "firepit",
		"encyclopedia_key": "racion_de_hierro",
	},
}


# --- ENCYCLOPEDIA ---
# Source: GDD Section 11.3 (entry list), GDD Section 11.2 (field schema)
# Fields per GDD Section 11.2: title, cuisine, category, prep_time, cook_time,
#   servings, cultural_note, ingredients, steps
# Full recipe content (steps, cultural_note, etc.) not specified in documents.
# Stubbed — to be authored in Build Step 15 (Encyclopedia + Save).
# Category values per GDD Section 11.2: Appetizer | Entrée | Beef | Pork |
#   Chicken | Side | Dessert | Drink
# Cuisine values per GDD Section 11.2: Mexican | Tex-Mex | American | British |
#   German | Russian | Irish | Scottish | Other
const ENCYCLOPEDIA := {
	"sopa_de_hierbas": {
		"id": "sopa_de_hierbas",
		"title": "Sopa de Hierbas",
		"cuisine": "Mexican",
		"category": "Entrée",
		"linked_recipe": "shadowherb_broth",
		"prep_time": "",
		"cook_time": "",
		"servings": "",
		"cultural_note": "",
		"ingredients": [],
		"steps": [],
	},
	"frutas_con_chile_y_sal": {
		"id": "frutas_con_chile_y_sal",
		"title": "Frutas con Chile y Sal",
		"cuisine": "Mexican",
		"category": "Appetizer",
		"linked_recipe": "salted_darkfruit",
		"prep_time": "",
		"cook_time": "",
		"servings": "",
		"cultural_note": "",
		"ingredients": [],
		"steps": [],
	},
	"caldo_de_pescado": {
		"id": "caldo_de_pescado",
		"title": "Caldo de Pescado",
		"cuisine": "Mexican",
		"category": "Entrée",
		"linked_recipe": "pale_fish_stew",
		"prep_time": "",
		"cook_time": "",
		"servings": "",
		"cultural_note": "",
		"ingredients": [],
		"steps": [],
	},
	"caldo_de_hueso": {
		"id": "caldo_de_hueso",
		"title": "Caldo de Hueso",
		"cuisine": "Mexican",
		"category": "Entrée",
		"linked_recipe": "bone_broth",
		"prep_time": "",
		"cook_time": "",
		"servings": "",
		"cultural_note": "",
		"ingredients": [],
		"steps": [],
	},
	"sopa_de_hongos_silvestres": {
		"id": "sopa_de_hongos_silvestres",
		"title": "Sopa de Hongos Silvestres",
		"cuisine": "Mexican",
		"category": "Entrée",
		"linked_recipe": "cursed_mushroom_soup",
		"prep_time": "",
		"cook_time": "",
		"servings": "",
		"cultural_note": "",
		"ingredients": [],
		"steps": [],
	},
	"festin_del_cazador": {
		"id": "festin_del_cazador",
		"title": "Festin del Cazador",
		"cuisine": "Mexican",
		"category": "Entrée",
		"linked_recipe": "hunters_feast",
		"prep_time": "",
		"cook_time": "",
		"servings": "",
		"cultural_note": "",
		"ingredients": [],
		"steps": [],
	},
	"conserva_de_la_bruja": {
		"id": "conserva_de_la_bruja",
		"title": "Conserva de la Bruja",
		"cuisine": "Mexican",
		"category": "Dessert",
		"linked_recipe": "witchs_preserve",
		"prep_time": "",
		"cook_time": "",
		"servings": "",
		"cultural_note": "",
		"ingredients": [],
		"steps": [],
	},
	"racion_de_hierro": {
		"id": "racion_de_hierro",
		"title": "Ración de Hierro",
		"cuisine": "American",
		"category": "Side",
		"linked_recipe": "iron_ration",
		"prep_time": "",
		"cook_time": "",
		"servings": "",
		"cultural_note": "",
		"ingredients": [],
		"steps": [],
	},
}


# --- Helper functions ---

func get_recipe(recipe_id: String) -> Dictionary:
	return RECIPES.get(recipe_id, {})


func get_all_recipes() -> Array:
	return RECIPES.values()


func get_encyclopedia_entry(entry_id: String) -> Dictionary:
	return ENCYCLOPEDIA.get(entry_id, {})


func get_all_encyclopedia_entries() -> Array:
	return ENCYCLOPEDIA.values()


func get_unlocked_recipes() -> Array:
	return RECIPES.values().filter(
		func(r): return r.id in GameState.progression.unlocked_recipes
	)
