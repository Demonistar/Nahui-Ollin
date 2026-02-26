extends Node

# ============================================================
# LORE DATA — All gods, classes, and patron data
# Source: Lore Bible v2
# NOTE: All names and narrative text sourced from Lore Bible v2.
#       Do not modify names or descriptions without consulting
#       the Lore Bible. "Never invent lore." — Session Guide Rule #2
# ============================================================

# --- GODS ---
# Each entry: id, nahuatl_name, display_name, domain, description,
#             portrait_color (placeholder), naming_ceremony_names,
#             offering_type, awareness_passive, reckoning_type
var gods: Dictionary = {
	"tonatiuh": {
		"id": "tonatiuh",
		"nahuatl_name": "Tōnatiuh",
		"display_name": "Tonatiuh",
		"domain": "Sun / War",
		"description": "The Fifth Sun. God of the sun and solar movement. Demands sacrifice to continue his journey across the sky.",
		"portrait_color": Color(1.0, 0.7, 0.0),
		"naming_ceremony_names": ["Nahui Ollin", "Chicnauhtonal", "Tlachinolli"],
		"offering_type": "blood",
		"awareness_passive": "sun_blessing",
		"reckoning_type": "earthquake",
	},
	"quetzalcoatl": {
		"id": "quetzalcoatl",
		"nahuatl_name": "Quetzalcōātl",
		"display_name": "Quetzalcoatl",
		"domain": "Wind / Wisdom",
		"description": "The Feathered Serpent. God of wind, air, and learning. Patron of the priesthood and crafts.",
		"portrait_color": Color(0.0, 0.8, 0.4),
		"naming_ceremony_names": ["Ce Acatl", "Tlahuizcalpantecuhtli", "Ehecatl"],
		"offering_type": "cacao",
		"awareness_passive": "wind_step",
		"reckoning_type": "wind_storm",
	},
	"huitzilopochtli": {
		"id": "huitzilopochtli",
		"nahuatl_name": "Huitzilopōchtli",
		"display_name": "Huitzilopochtli",
		"domain": "War / Sun",
		"description": "Hummingbird of the South. God of war, sun, and patron of the Mexica. Born fully armed to drive back the stars.",
		"portrait_color": Color(0.0, 0.4, 1.0),
		"naming_ceremony_names": ["Mexi", "Ilhuicatl Xoxouhqui", "Tetzahuitl"],
		"offering_type": "meat",
		"awareness_passive": "war_fervor",
		"reckoning_type": "solar_flare",
	},
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
	"xipe_totec": {
		"id": "xipe_totec",
		"nahuatl_name": "Xīpe Tōtec",
		"display_name": "Xipe Totec",
		"domain": "Agriculture / Renewal",
		"description": "Our Lord the Flayed One. God of agriculture, seasons, and renewal. The new growth that emerges from sacrifice.",
		"portrait_color": Color(0.8, 0.3, 0.1),
		"naming_ceremony_names": ["Tlatlauhca", "Yohuallahuan", "Itztapaltotec"],
		"offering_type": "ingredients",
		"awareness_passive": "renewal_surge",
		"reckoning_type": "plague",
	},
	"tezcatlipoca": {
		"id": "tezcatlipoca",
		"nahuatl_name": "Tezcatlipōca",
		"display_name": "Tezcatlipoca",
		"domain": "Night / Sorcery / Chaos",
		"description": "Smoking Mirror. God of the night sky, sorcery, and conflict. Eternal rival of Quetzalcoatl. He sees all in his obsidian mirror.",
		"portrait_color": Color(0.15, 0.05, 0.3),
		"naming_ceremony_names": ["Titlacauan", "Moyocoyani", "Necoc Yaotl"],
		"offering_type": "stone",
		"awareness_passive": "shadow_sight",
		"reckoning_type": "shadow_consume",
	},
	"chalchiuhtlicue": {
		"id": "chalchiuhtlicue",
		"nahuatl_name": "Chalchiuhtlicue",
		"display_name": "Chalchiuhtlicue",
		"domain": "Water / Rivers / Protection",
		"description": "She of the Jade Skirt. Goddess of rivers, lakes, and running water. She presided over the Fourth Sun and sheltered the survivors of its flood.",
		"portrait_color": Color(0.0, 0.7, 0.7),
		"naming_ceremony_names": ["Acuecueyotl", "Chalchiuhtlatonal", "Ayauhcihuatl"],
		"offering_type": "cacao",
		"awareness_passive": "jade_ward",
		"reckoning_type": "tidal_wave",
	},
	"mictlantecuhtli": {
		"id": "mictlantecuhtli",
		"nahuatl_name": "Mictlantēcuhtli",
		"display_name": "Mictlantecuhtli",
		"domain": "Death / Underworld",
		"description": "Lord of Mictlan. God of death and ruler of the underworld. He who waits at the end of all journeys, patient and absolute.",
		"portrait_color": Color(0.9, 0.85, 0.8),
		"naming_ceremony_names": ["Nextepehua", "Ixpuztec", "Tzontemoc"],
		"offering_type": "gold",
		"awareness_passive": "death_harvest",
		"reckoning_type": "undead_surge",
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
		"preferred_gods": ["tonatiuh", "huitzilopochtli"],
		"starting_skill": "eagle_strike",
		"color": Color(0.9, 0.7, 0.1),
	},
	"jaguar_warrior": {
		"id": "jaguar_warrior",
		"nahuatl_name": "Ocēlōtl",
		"display_name": "Jaguar Warrior",
		"description": "Masters of stealth and close combat. High defense and speed.",
		"stat_bonuses": { "attack": 2, "defense": 3, "speed": 2, "max_hp": 0 },
		"preferred_gods": ["tezcatlipoca"],
		"starting_skill": "shadow_step",
		"color": Color(0.3, 0.2, 0.0),
	},
	"tlamacazqui": {
		"id": "tlamacazqui",
		"nahuatl_name": "Tlamacazqui",
		"display_name": "Priest",
		"description": "Servants of the gods. Gain god awareness faster and offerings have greater effect.",
		"stat_bonuses": { "attack": 0, "defense": 2, "speed": 0, "max_hp": 20 },
		"preferred_gods": ["quetzalcoatl", "tlaloc"],
		"starting_skill": "offering_rite",
		"color": Color(0.5, 0.8, 0.5),
	},
	"pochtecatl": {
		"id": "pochtecatl",
		"nahuatl_name": "Pōchtēcatl",
		"display_name": "Merchant",
		"description": "Long-distance traders with sharp eyes. Start with bonus gold and gather more from resource nodes.",
		"stat_bonuses": { "attack": 0, "defense": 0, "speed": 1, "max_hp": 10 },
		"preferred_gods": ["quetzalcoatl", "xipe_totec"],
		"starting_skill": "trader_eye",
		"color": Color(0.7, 0.6, 0.2),
	},
}

# --- PATRON BONUSES ---
# Applied when class preferred_god matches chosen patron
var patron_bonuses: Dictionary = {
	"tonatiuh": { "attack_bonus": 3, "awareness_gain_mult": 1.2 },
	"quetzalcoatl": { "speed_bonus": 1, "cacao_gather_mult": 1.5 },
	"huitzilopochtli": { "attack_bonus": 5, "meat_gather_mult": 1.3 },
	"tlaloc": { "max_hp_bonus": 15, "wood_gather_mult": 1.5 },
	"xipe_totec": { "ingredients_gather_mult": 1.5, "heal_on_cook": 5 },
	"tezcatlipoca": { "defense_bonus": 4, "gold_on_kill": 1, "stone_gather_mult": 1.5 },
	"chalchiuhtlicue": { "max_hp_bonus": 20, "cacao_gather_mult": 1.5, "awareness_gain_mult": 1.1 },
	"mictlantecuhtli": { "attack_bonus": 4, "resource_on_kill_chance": 0.25, "gold_gather_mult": 1.5 },
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
