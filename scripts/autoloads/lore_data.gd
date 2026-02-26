extends Node

# ============================================================
# LORE DATA — All gods, classes, and patron data
# Source: Lore Bible v2
# NOTE: All names and narrative text sourced from Lore Bible v2.
#       Do not modify names or descriptions without consulting
#       the Lore Bible. "Never invent lore." — Session Guide Rule #2
# ============================================================

# --- GODS (8 candidate gods) ---
# Each entry: id, nahuatl_name, display_name, domain, description,
#             portrait_color (placeholder), naming_ceremony_names,
#             offering_type, awareness_passive, reckoning_type
var gods: Dictionary = {
	"tlaloc": {
		"id": "tlaloc",
		"nahuatl_name": "Tlāloc",
		"display_name": "Tlaloc",
		"domain": "Rain / Agriculture",
		"description": "He Who Makes Things Sprout. God of rain, fertility, and water. Sends rain or drought at his will.",
		"portrait_color": Color(0.2, 0.5, 0.9),
		"naming_ceremony_names": ["Epcoatl", "Xoxouhqui", "Nappatecuhtli"],
		"offering_type": "wood",
		"awareness_passive": "harvest_bounty",
		"reckoning_type": "flood",
	},
	"chicomecoatl": {
		"id": "chicomecoatl",
		"nahuatl_name": "Chicomecōātl",
		"display_name": "Chicomecoatl",
		"domain": "Maize / Sustenance / Abundance",
		"description": "Seven Serpent. Goddess of maize and sustenance. She provides the nourishment that keeps the Fifth Sun's people alive.",
		"portrait_color": Color(0.9, 0.8, 0.2),
		"naming_ceremony_names": ["Xilonen", "Chalchiuhcihuatl", "Centeotl"],
		"offering_type": "ingredients",
		"awareness_passive": "maize_blessing",
		"reckoning_type": "famine",
	},
	"xochipilli": {
		"id": "xochipilli",
		"nahuatl_name": "Xōchipilli",
		"display_name": "Xochipilli",
		"domain": "Flowers / Song / Beauty / Summer",
		"description": "Flower Prince. God of art, games, beauty, dance, flowers, and song. Patron of those who live joyfully under the Fifth Sun.",
		"portrait_color": Color(1.0, 0.4, 0.7),
		"naming_ceremony_names": ["Macuilxochitl", "Ahuiateotl", "Centeotzintli"],
		"offering_type": "cacao",
		"awareness_passive": "flower_song",
		"reckoning_type": "blight",
	},
	"xochiquetzal": {
		"id": "xochiquetzal",
		"nahuatl_name": "Xōchiquetzal",
		"display_name": "Xochiquetzal",
		"domain": "Beauty / Weaving / Desire / Craft",
		"description": "Precious Flower. Goddess of beauty, female sexuality, weaving, and household crafts. She who guards the threads of mortal lives.",
		"portrait_color": Color(0.9, 0.3, 0.6),
		"naming_ceremony_names": ["Ichpōchtli", "Tonacacihuatl", "Xochiquetzalli"],
		"offering_type": "gold",
		"awareness_passive": "weavers_eye",
		"reckoning_type": "unraveling",
	},
	"xipe_totec": {
		"id": "xipe_totec",
		"nahuatl_name": "Xīpe Tōtec",
		"display_name": "Xipe Totec",
		"domain": "Agriculture / Renewal",
		"description": "Our Lord the Flayed One. God of agriculture, seasons, and renewal. The new growth that emerges from sacrifice.",
		"portrait_color": Color(0.8, 0.3, 0.1),
		"naming_ceremony_names": ["Tlatlauhca", "Yohuallahuan", "Itztapaltotec"],
		"offering_type": "meat",
		"awareness_passive": "renewal_surge",
		"reckoning_type": "plague",
	},
	"tlazolteotl": {
		"id": "tlazolteotl",
		"nahuatl_name": "Tlazōlteōtl",
		"display_name": "Tlazolteotl",
		"domain": "Purification / Earth / Filth / Sin",
		"description": "Filth Eater. Goddess of purification and earth. She devours sin and filth, cleansing those who confess to her — but her hunger is never sated.",
		"portrait_color": Color(0.45, 0.25, 0.45),
		"naming_ceremony_names": ["Ixcuina", "Tlaelquani", "Tlahueliloc"],
		"offering_type": "stone",
		"awareness_passive": "sin_eater",
		"reckoning_type": "filth_flood",
	},
	"mixcoatl": {
		"id": "mixcoatl",
		"nahuatl_name": "Mixcōātl",
		"display_name": "Mixcoatl",
		"domain": "Hunting / Stars / War",
		"description": "Cloud Serpent. God of the hunt, the Milky Way, and war. He painted the sky with stars and taught mortals to track and kill.",
		"portrait_color": Color(0.35, 0.45, 0.65),
		"naming_ceremony_names": ["Camaxtle", "Iztac Mixcoatl", "Camaxtli"],
		"offering_type": "wood",
		"awareness_passive": "hunter_sight",
		"reckoning_type": "star_hunt",
	},
	"itzpapalotl": {
		"id": "itzpapalotl",
		"nahuatl_name": "Itzpāpālōtl",
		"display_name": "Itzpapalotl",
		"domain": "Death / Stars / Sacrifice",
		"description": "Obsidian Butterfly. Skeletal warrior goddess, ruler of Tamoanchan. Her wings are bladed with obsidian. She hunts those who die without purpose.",
		"portrait_color": Color(0.05, 0.0, 0.12),
		"naming_ceremony_names": ["Citlalicue", "Quilaztli", "Itzpapalotl Teteoh"],
		"offering_type": "cacao",
		"awareness_passive": "obsidian_wing",
		"reckoning_type": "obsidian_storm",
	},
}

# --- HERO CLASSES ---
# Each entry: id, nahuatl_name, display_name, description,
#             stat_bonuses, preferred_gods, starting_skill, color
var classes: Dictionary = {
	"eagle_warrior": {
		"id": "eagle_warrior",
		"nahuatl_name": "Cuāuhtli",
		"display_name": "Eagle Warrior",
		"description": "Elite warriors who embody the power of the eagle. High attack and favor from war gods.",
		"stat_bonuses": { "attack": 5, "defense": 0, "speed": 1, "max_hp": 0 },
		"preferred_gods": ["xipe_totec", "mixcoatl"],
		"starting_skill": "eagle_strike",
		"color": Color(0.9, 0.7, 0.1),
	},
	"jaguar_warrior": {
		"id": "jaguar_warrior",
		"nahuatl_name": "Ocēlōtl",
		"display_name": "Jaguar Warrior",
		"description": "Masters of stealth and close combat. High defense and speed.",
		"stat_bonuses": { "attack": 2, "defense": 3, "speed": 2, "max_hp": 0 },
		"preferred_gods": ["itzpapalotl", "xipe_totec"],
		"starting_skill": "shadow_step",
		"color": Color(0.3, 0.2, 0.0),
	},
	"tlamacazqui": {
		"id": "tlamacazqui",
		"nahuatl_name": "Tlamacazqui",
		"display_name": "Priest",
		"description": "Servants of the gods. Gain god awareness faster and offerings have greater effect.",
		"stat_bonuses": { "attack": 0, "defense": 2, "speed": 0, "max_hp": 20 },
		"preferred_gods": ["tlaloc", "chicomecoatl"],
		"starting_skill": "offering_rite",
		"color": Color(0.5, 0.8, 0.5),
	},
	"pochtecatl": {
		"id": "pochtecatl",
		"nahuatl_name": "Pōchtēcatl",
		"display_name": "Merchant",
		"description": "Long-distance traders with sharp eyes. Start with bonus gold and gather more from resource nodes.",
		"stat_bonuses": { "attack": 0, "defense": 0, "speed": 1, "max_hp": 10 },
		"preferred_gods": ["xochiquetzal", "xochipilli"],
		"starting_skill": "trader_eye",
		"color": Color(0.7, 0.6, 0.2),
	},
}

# --- PATRON BONUSES ---
# Applied when class preferred_god matches chosen patron
var patron_bonuses: Dictionary = {
	"tlaloc": { "max_hp_bonus": 15, "wood_gather_mult": 1.5 },
	"chicomecoatl": { "ingredients_gather_mult": 1.5, "heal_on_cook": 8 },
	"xochipilli": { "speed_bonus": 1, "cacao_gather_mult": 1.3, "awareness_gain_mult": 1.2 },
	"xochiquetzal": { "gold_gather_mult": 1.5, "crafting_cost_mult": 0.8 },
	"xipe_totec": { "attack_bonus": 3, "meat_gather_mult": 1.4 },
	"tlazolteotl": { "defense_bonus": 4, "stone_gather_mult": 1.5, "heal_on_kill": 3 },
	"mixcoatl": { "attack_bonus": 4, "wood_gather_mult": 1.3, "meat_gather_mult": 1.3 },
	"itzpapalotl": { "attack_bonus": 5, "cacao_gather_mult": 1.4, "gold_on_kill": 1 },
}


func get_god(god_id: String) -> Dictionary:
	return gods.get(god_id, {})


func get_class(class_id: String) -> Dictionary:
	return classes.get(class_id, {})


func get_all_gods() -> Array:
	return gods.values()


func get_all_classes() -> Array:
	return classes.values()


func get_god_naming_names(god_id: String) -> Array:
	return gods.get(god_id, {}).get("naming_ceremony_names", [])


func get_patron_bonus(god_id: String) -> Dictionary:
	return patron_bonuses.get(god_id, {})
