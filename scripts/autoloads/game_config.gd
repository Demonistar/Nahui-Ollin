extends Node

# ============================================================
# GAME CONFIGURATION — All constants for Fifth Sun: Nahui Ollin
# Source: Build Bible Section 2.1
# ============================================================

# --- GRID / MAP ---
const TILE_SIZE: int = 64
const MAP_WIDTH: int = 16
const MAP_HEIGHT: int = 16
const MAP_PIXEL_WIDTH: int = TILE_SIZE * MAP_WIDTH    # 1024
const MAP_PIXEL_HEIGHT: int = TILE_SIZE * MAP_HEIGHT  # 1024

# --- HERO ---
const HERO_SIZE: Vector2 = Vector2(28, 28)
const HERO_BASE_HP: int = 100
const HERO_BASE_ATTACK: int = 10
const HERO_BASE_DEFENSE: int = 5
const HERO_BASE_SPEED: int = 1
const HERO_MAX_LEVEL: int = 10
const HERO_XP_BASE: int = 100
const HERO_XP_SCALE: float = 1.5

# --- HUNGER ---
const HUNGER_MAX: int = 100
const HUNGER_DRAIN_RATE: float = 2.0       # per second (prologue only)
const HUNGER_DAMAGE_THRESHOLD: int = 0
const HUNGER_DAMAGE_RATE: float = 5.0      # HP per second when starved

# --- MISSION ---
const MISSION_TIMER_DEFAULT: float = 300.0    # 5 minutes
const ENEMY_SPAWN_DELAY: float = 15.0         # seconds before first wave
const ENEMY_WAVE_INTERVAL: float = 30.0       # seconds between waves
const ENEMY_WAVE_COUNT_BASE: int = 3
const DEATH_RESOURCE_KEEP: float = 0.25       # 25% of resources kept on death

# --- COMBAT ---
const AUTO_ATTACK_RANGE: float = 96.0         # pixels
const AUTO_ATTACK_COOLDOWN: float = 1.0       # seconds
const ANIMAL_FLEE_RADIUS: float = 128.0
const ANIMAL_ATTACK_CHANCE: float = 0.3

# --- RESOURCE NODES ---
const RESOURCE_NODE_CHARGES_MIN: int = 2
const RESOURCE_NODE_CHARGES_MAX: int = 5
const RESOURCE_NODE_DENSITY: float = 0.08    # fraction of map tiles

# --- LEVELING / XP ---
const XP_PER_ENEMY_BASE: int = 25
const XP_PER_ANIMAL: int = 10
const AP_PER_ASCENSION_BASE: int = 10        # Ascension Points

# --- GODS ---
const GOD_AWARENESS_MAX: int = 100
const GOD_OFFERING_VALUE: int = 10
const SACRIFICE_AWARENESS_THRESHOLD: int = 75

# --- ECONOMY ---
const CACAO_BEAN_VALUE: int = 5
const SHOP_RESTOCK_COST: int = 20

# --- QUESTS ---
const QUEST_POINTS_START: int = 3
const QUEST_REWARD_XP_BASE: int = 50

# --- SKILL TREE ---
const SKILL_NODE_MAX: int = 20

# --- ENTITY SPRITE SIZES (placeholder rects) ---
const ENEMY_SIZE: Vector2 = Vector2(24, 24)
const ANIMAL_SIZE: Vector2 = Vector2(26, 26)
const RESOURCE_NODE_SIZE: Vector2 = Vector2(20, 20)
const GOD_PORTRAIT_SIZE: Vector2 = Vector2(64, 64)

# --- SAVE ---
const SAVE_FILE_PATH: String = "user://fifth_sun_save.json"
const SAVE_VERSION: int = 1

# --- SCENE PATHS ---
const SCENE_MAIN: String = "res://scenes/main.tscn"
const SCENE_CHARACTER_SELECT: String = "res://scenes/character_select.tscn"
const SCENE_PROLOGUE: String = "res://scenes/prologue/prologue.tscn"
const SCENE_HUB: String = "res://scenes/hub/hub.tscn"
const SCENE_MISSION: String = "res://scenes/mission/mission.tscn"
const SCENE_COUNCIL: String = "res://scenes/hub/council.tscn"
const SCENE_RECKONING: String = "res://scenes/reckoning/reckoning.tscn"
const SCENE_NAMING: String = "res://scenes/reckoning/naming_ceremony.tscn"

# --- PLACEHOLDER COLORS ---
const COLOR_HERO_MALE: Color = Color(0.2, 0.6, 1.0)
const COLOR_HERO_FEMALE: Color = Color(1.0, 0.4, 0.8)
const COLOR_ENEMY: Color = Color(1.0, 0.2, 0.2)
const COLOR_ANIMAL: Color = Color(0.6, 0.9, 0.3)
const COLOR_RESOURCE_TIER1: Color = Color(0.4, 0.8, 0.4)
const COLOR_RESOURCE_TIER2: Color = Color(0.2, 0.6, 1.0)
const COLOR_RESOURCE_TIER3: Color = Color(0.9, 0.7, 0.1)
const COLOR_TILE_GROUND: Color = Color(0.55, 0.45, 0.3)
const COLOR_TILE_IMPASSABLE: Color = Color(0.25, 0.2, 0.15)
