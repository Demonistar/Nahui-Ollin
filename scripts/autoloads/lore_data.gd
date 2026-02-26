extends Node

# ============================================================
# LORE DATA — Gods, classes, and patron data
# Source: Lore Bible v2.0
# Session Guide Rule 2: Never invent lore.
# All names, descriptions, and narrative text taken directly
# from the Lore Bible. Do not modify without consulting it.
# ============================================================


# --- PERSUASION STATES (Lore Bible Section VII) ---
const PERSUASION_STATES := [
	{"key": "unaware",     "min_pct": 0,   "max_pct": 0,   "display": "Unaware",     "portrait": "Greyed out, no glow"},
	{"key": "aware",       "min_pct": 1,   "max_pct": 30,  "display": "Aware",       "portrait": "Visible, faint glow"},
	{"key": "considering", "min_pct": 31,  "max_pct": 60,  "display": "Considering", "portrait": "Clear, soft golden glow"},
	{"key": "inclined",    "min_pct": 61,  "max_pct": 90,  "display": "Inclined",    "portrait": "Bright, pulsing glow"},
	{"key": "committed",   "min_pct": 91,  "max_pct": 100, "display": "Committed",   "portrait": "Fully lit, strong glow, name highlighted in gold"},
]


# --- PATRONS (Lore Bible Section III) ---
const PATRONS := {
	"quetzalcoatl": {
		"id": "quetzalcoatl",
		"display_name": "Quetzalcoatl",
		"subtitle": "The Feathered Serpent",
		"philosophy": "Humanity is worth saving as it currently is. Not as it could be with more time, not as it might become — as it is right now, with all its failures intact.",
		"teaching_method": "Through reading. He brings texts — codices, letters, ordinary records of ordinary days. He shows the Last Child what humans wrote down when they thought no one would ever read it.",
		"voice": "Measured, warm, precise. Occasionally dry. He has been practicing how to talk to humans for a very long time and he is good at it.",
		"hidden_truth": "Quetzalcoatl is more attached to the Last Child specifically than to the outcome generally. He tells himself this does not affect his judgment. It does.",
	},
	"tezcatlipoca": {
		"id": "tezcatlipoca",
		"display_name": "Tezcatlipoca",
		"subtitle": "The Smoking Mirror",
		"philosophy": "Compassion without standards is not compassion — it is enablement. Humanity has to earn the Sixth Sun. Not through perfection but through demonstrated willingness to face what it actually is.",
		"teaching_method": "Through the mirror. He shows the Last Child the world as it is, with beauty and atrocity given equal weight. He refuses to editorialize. He shows and asks what they see.",
		"voice": "Direct, unhurried. Asks genuine questions and waits for genuine answers. Refuses to soften things but also refuses to perform harshness.",
		"hidden_truth": "Tezcatlipoca's mirror shows him that the Sixth Sun will have less use for gods like him. He knows this. He chooses it anyway. He has not told Quetzalcoatl.",
	},
}


# --- GODS (8 candidate gods, Lore Bible Section IV) ---
# portrait_color: placeholder values for POC (Build Bible Section 11.3 — no specific colors specified)
# quests: empty array stub — content populated in Build Step 11
const GODS := {
	"tlaloc": {
		"id": "tlaloc",
		"display_name": "Tlaloc",
		"domain": "Rain, water, agriculture",
		"patron_alignment": "neutral",
		"description": "The god of rain. He gave them water when they gave him their children. He has not forgotten either half of that transaction.",
		"portrait_color": Color(0.2, 0.5, 0.9),
		"naming_ceremony_names": [
			{"name": "Nahui Atl",          "translation": "The Drowned Age"},
			{"name": "Chalchiuh Tonatiuh", "translation": "Jade Sun — the Fertile Age"},
			{"name": "Atl Tlachinolli",    "translation": "Water and Fire — the Age of Contradiction"},
			{"name": "Tlapalteotl",        "translation": "The Painted God's Age"},
			{"name": "Ehecatl Atl",        "translation": "Wind and Water — the Restless Age"},
		],
		"world_consequence": "Constant generous rain. Impossibly fertile land. Rising seas. Marine evolution accelerated by millennia — Megalodons are real. The ocean is not for humans.",
		"victory_crawl": "Tlaloc stepped into the fire without ceremony. He had always preferred directness. The rain began before the light did. The Sixth Sun ignited behind clouds so thick they seemed permanent. The land bloomed. Crops reached heights that defied agricultural logic. And the oceans deepened. The Megalodons are real. The ocean is not for humans. This is simply true now.",
		"quests": [],
	},
	"chicomecoatl": {
		"id": "chicomecoatl",
		"display_name": "Chicomecoatl",
		"domain": "Corn, harvest, sustenance",
		"patron_alignment": "quetzalcoatl",
		"description": "The goddess of corn and harvest. She fed them when nothing else would. She is not angry that they forgot to thank her. She is angry that they let each other go hungry anyway.",
		"portrait_color": Color(0.9, 0.8, 0.2),
		"naming_ceremony_names": [
			{"name": "Chicome Xochitl",   "translation": "Seven Flower — the Satisfied Age"},
			{"name": "Tonacayotl",        "translation": "The Age of Sustenance"},
			{"name": "Centeotl Tonatiuh", "translation": "Corn God's Sun — the Quiet Age"},
		],
		"world_consequence": "No hunger structurally possible. Agricultural systems at impossible fertility. Four generations in: declining urgency. Comfort breeds a civilization of tremendous satisfaction and reduced drive.",
		"victory_crawl": "Chicomecoatl stepped into the fire and the fire smelled like corn. The Sixth Sun rose over fields already growing. The world does not know hunger — this is not hyperbole. Within four generations it has produced exactly what she feared: declining urgency. The hunger that drove human innovation is quieted.",
		"quests": [],
	},
	"xochipilli": {
		"id": "xochipilli",
		"display_name": "Xochipilli",
		"domain": "Flowers, beauty, games, art, joy",
		"patron_alignment": "quetzalcoatl",
		"description": "The god of everything humans do when they don't have to. He is not sure the world deserves a beautiful Sixth Sun. He is also not sure it deserves an ugly one.",
		"portrait_color": Color(1.0, 0.4, 0.7),
		"naming_ceremony_names": [
			{"name": "Nahui Xochitl", "translation": "Four Flower — the Beautiful Age"},
			{"name": "Toltecayotl",   "translation": "The Age of Art"},
			{"name": "Xochiyaoyotl",  "translation": "The Flower War Sun"},
		],
		"world_consequence": "Overwhelming beauty. Extraordinary culture. Survival skills atrophy — the world is beautiful and not particularly dangerous and people are not building the muscles that difficult circumstances build.",
		"victory_crawl": "Xochipilli stepped into the fire laughing — not from madness but from the absurdity of it, that beauty could only be preserved by being destroyed. The Sixth Sun is beautiful. Staggeringly, impossibly, continuously beautiful. The catch is subtle: survival skills atrophy.",
		"quests": [],
	},
	"xochiquetzal": {
		"id": "xochiquetzal",
		"display_name": "Xochiquetzal",
		"domain": "Love, beauty, weaving, desire",
		"patron_alignment": "quetzalcoatl",
		"description": "The goddess of love and making. She watched them love each other through five ages and she is still not over it. This is not a weakness.",
		"portrait_color": Color(0.9, 0.3, 0.6),
		"naming_ceremony_names": [
			{"name": "Tlazohtla Tonatiuh", "translation": "The Sun of Love"},
			{"name": "Nepapan Xochitl",    "translation": "Many-Flowered Sun"},
			{"name": "Yectli Tonatiuh",    "translation": "The Good Sun"},
		],
		"world_consequence": "Stronger human bonds. Reduced loneliness. Population expansion beyond sustainability. Wars fought by people who would die for each other — more devastating for the love behind them.",
		"victory_crawl": "Xochiquetzal stepped into the fire and the fire wept. The world that emerged was built on connection. The loneliness epidemic of the later Fifth Sun significantly reduced. The catch: the math. More humans, finite resources. Wars fought by people who love deeply are the worst kind.",
		"quests": [],
	},
	"xipe_totec": {
		"id": "xipe_totec",
		"display_name": "Xipe Totec",
		"domain": "Renewal, sacrifice, seasons",
		"patron_alignment": "tezcatlipoca",
		"description": "The god of renewal through sacrifice. He knows exactly what the sacrifice costs. He is the only one who has felt it from the inside.",
		"portrait_color": Color(0.8, 0.3, 0.1),
		"naming_ceremony_names": [
			{"name": "Nahui Ehecatl II",  "translation": "Four Wind — the Age of Cycles"},
			{"name": "Xippilli Tonatiuh", "translation": "Prince of Turquoise Sun"},
			{"name": "Tlahuiztli",        "translation": "The Radiant Renewal"},
		],
		"world_consequence": "Accelerated renewal. Explosive growth, rapid decay. Nothing lingers past its season. Nothing stays dead — including wounds, feuds, and ancient grievances.",
		"victory_crawl": "Xipe Totec removed his skin and stepped into the fire wearing nothing. The Sixth Sun ignited in cycles — not one continuous blaze but pulsing, rhythmic light. Nothing stays dead. Not plants, not ideas, not feuds that should have closed centuries ago.",
		"quests": [],
	},
	"tlazolteotl": {
		"id": "tlazolteotl",
		"display_name": "Tlazolteotl",
		"domain": "Purification, confession, truth",
		"patron_alignment": "neutral",
		"description": "The goddess who eats sins. She knows everything that was ever confessed to her. She has not judged any of it. That is harder than it sounds.",
		"portrait_color": Color(0.45, 0.25, 0.45),
		"naming_ceremony_names": [
			{"name": "Yohualli Ehecatl", "translation": "Night Wind — the Honest Age"},
			{"name": "Tlapalteotl II",   "translation": "The Unvarnished Sun"},
			{"name": "Neltiliztli",      "translation": "The Age of Truth"},
		],
		"world_consequence": "Genuine honesty. Structures that make honesty the path of least resistance. Tlazolteotl takes all accumulated sin into the fire with her — the world has no accumulated darkness and no immunity to darkness when it returns.",
		"victory_crawl": "Tlazolteotl stepped into the fire and took everything with her. Every sin ever confessed, every shame ever spoken, every secret cruelty ever admitted. The world that emerged was honest in ways that felt almost violent. The catch: no accumulated darkness, no recognition of it when it returns.",
		"quests": [],
	},
	"mixcoatl": {
		"id": "mixcoatl",
		"display_name": "Mixcoatl",
		"domain": "Stars, hunting, navigation",
		"patron_alignment": "tezcatlipoca",
		"description": "The god of stars and hunting. He mapped the sky so humans would never be lost. He is bitter that they stopped looking up.",
		"portrait_color": Color(0.35, 0.45, 0.65),
		"naming_ceremony_names": [
			{"name": "Citlalin Tonatiuh", "translation": "Star Sun — the Age of Navigation"},
			{"name": "Nahui Malinalli",   "translation": "Four Grass — the Wandering Age"},
			{"name": "Tlapallan",         "translation": "The Place of Color — the Age of Discovery"},
		],
		"world_consequence": "Navigation is instinctive. Children read stars before words. The Milky Way is brighter, more clearly a map. The catch: always leaving. Communities form and dissolve. After four generations they have explored the entire planet and do not know what to do now that there is nowhere left to go.",
		"victory_crawl": "Mixcoatl stepped into the fire looking up. The sky changed. The Milky Way rearranged itself according to his internal map. Navigation is instinctive. The civilization explores more in its first century than any previous age explored in five. The catch: always leaving. Roots don't grow deep.",
		"quests": [],
	},
	"itzpapalotl": {
		"id": "itzpapalotl",
		"display_name": "Itzpapalotl",
		"domain": "Sacrifice, war, fate",
		"patron_alignment": "tezcatlipoca",
		"description": "The warrior goddess. She believes the Sixth Sun needs teeth. She is the least interested in being convinced. She is also the one most likely to respect you for trying.",
		"portrait_color": Color(0.05, 0.0, 0.12),
		"naming_ceremony_names": [
			{"name": "Nahui Itztli",    "translation": "Four Obsidian — the Age of Blades"},
			{"name": "Yaotl Tonatiuh",  "translation": "Warrior Sun — the Eternal War"},
			{"name": "Tezca Tonatiuh",  "translation": "Mirror Sun — the Age of Hard Truth"},
		],
		"world_consequence": "Constant conflict. Genuine courage. Unmistakable heroes and cowards. People die regularly. Children grow up ready for violence before much else. The small pockets of peace are always temporary, always remarkable.",
		"victory_crawl": "Itzpapalotl stepped into the fire without looking back. She had never hesitated at anything. The Sixth Sun ignited with an edge — not warm light but sharp light that casts hard shadows. The world knows no peace. In that conflict: more genuine courage, more meaningful sacrifice than any previous age. The catch: people die. Regularly.",
		"quests": [],
	},
}


# --- CLASSES (Lore Bible Section VI) ---
# taught_by: patron or god id(s) as listed in the Lore Bible table
const CLASSES := {
	"investigator": {
		"id": "investigator",
		"display_name": "The Investigator",
		"taught_by": ["quetzalcoatl"],
		"combat_role": "Debuffer / Intel",
		"out_of_combat": "Research speed +50%. Fragment find rate +25%.",
	},
	"soldier": {
		"id": "soldier",
		"display_name": "The Soldier",
		"taught_by": ["itzpapalotl"],
		"combat_role": "Tank / Front Line",
		"out_of_combat": "Shop discounts 15%. Damage reduction passive.",
	},
	"occultist": {
		"id": "occultist",
		"display_name": "The Occultist",
		"taught_by": ["tezcatlipoca"],
		"combat_role": "AoE Caster",
		"out_of_combat": "Reveals hidden recipe fragments. Dark patron bonus.",
	},
	"herbalist": {
		"id": "herbalist",
		"display_name": "The Herbalist",
		"taught_by": ["chicomecoatl", "xochiquetzal"],
		"combat_role": "Healer / Support",
		"out_of_combat": "Ingredient substitution in recipes. Cooking time -25%.",
	},
	"hunter": {
		"id": "hunter",
		"display_name": "The Hunter",
		"taught_by": ["mixcoatl"],
		"combat_role": "Single Target DPS",
		"out_of_combat": "Rare drop rate +20%. Animal tracking range +50%.",
	},
	"priest": {
		"id": "priest",
		"display_name": "The Priest",
		"taught_by": ["tlaloc", "tlazolteotl"],
		"combat_role": "Buffer / Support",
		"out_of_combat": "Quest reward buff duration +50%. God favor gain +10%.",
	},
	"scholar": {
		"id": "scholar",
		"display_name": "The Scholar",
		"taught_by": ["quetzalcoatl"],
		"combat_role": "Utility / Enabler",
		"out_of_combat": "XP gain +25%. Encyclopedia entries unlock faster.",
	},
	"penitent": {
		"id": "penitent",
		"display_name": "The Penitent",
		"taught_by": ["tlazolteotl"],
		"combat_role": "Evasion / Punisher",
		"out_of_combat": "Sin mechanic — damage scales with wounds taken this run.",
	},
}


# --- DUAL-CLASS EVOLUTION TITLES (Lore Bible Section VI) ---
const DUAL_CLASS_TITLES := [
	{
		"class1": "investigator", "class2": "occultist",
		"evolution_title": "Archivist of Forbidden Things",
		"combined_bonus": "Fragment rate doubled, hidden lore unlocks",
	},
	{
		"class1": "soldier", "class2": "hunter",
		"evolution_title": "Jaguar Knight",
		"combined_bonus": "Single target damage +40%, never slowed",
	},
	{
		"class1": "occultist", "class2": "priest",
		"evolution_title": "Voice of the Smoking Mirror",
		"combined_bonus": "AoE applies buffs to self, debuffs to enemies",
	},
	{
		"class1": "herbalist", "class2": "scholar",
		"evolution_title": "Keeper of Living Knowledge",
		"combined_bonus": "Cooking produces double yield, recipes cost less",
	},
	{
		"class1": "investigator", "class2": "soldier",
		"evolution_title": "Battle Archivist",
		"combined_bonus": "Debuffs apply on physical hits, tanking generates research",
	},
	{
		"class1": "hunter", "class2": "penitent",
		"evolution_title": "Blood-Marked Predator",
		"combined_bonus": "Sin charges double as precision stacks for next kill",
	},
	{
		"class1": "priest", "class2": "herbalist",
		"evolution_title": "Sacred Hearthkeeper",
		"combined_bonus": "All heals also buff nearby quest tracking progress",
	},
	{
		"class1": "scholar", "class2": "occultist",
		"evolution_title": "Witness of Unwritten Things",
		"combined_bonus": "XP bonus applies to god favor gain as well",
	},
]


# --- Helper functions ---

func get_god(god_id: String) -> Dictionary:
	return GODS.get(god_id, {})


func get_class(class_id: String) -> Dictionary:
	return CLASSES.get(class_id, {})


func get_patron(patron_id: String) -> Dictionary:
	return PATRONS.get(patron_id, {})


func get_all_gods() -> Array:
	return GODS.values()


func get_all_classes() -> Array:
	return CLASSES.values()


func get_god_naming_names(god_id: String) -> Array:
	return GODS.get(god_id, {}).get("naming_ceremony_names", [])


func get_persuasion_state(pct: float) -> Dictionary:
	for state in PERSUASION_STATES:
		if pct <= state.max_pct:
			return state
	return PERSUASION_STATES[-1]


func get_evolution_title(class1: String, class2: String) -> String:
	for pair in DUAL_CLASS_TITLES:
		if (pair.class1 == class1 and pair.class2 == class2) \
				or (pair.class1 == class2 and pair.class2 == class1):
			return pair.evolution_title
	return ""
