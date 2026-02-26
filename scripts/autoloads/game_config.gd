extends Node

# ============================================================
# GAME CONFIG — All tunable constants for Fifth Sun: Nahui Ollin
# Source: Build Bible v1 Section 2.1
# Reference via GameConfig.CONSTANT_NAME everywhere.
# Never hardcode these values.
# ============================================================

# MAP
const GRID_SIZE_START := 16
const GRID_SIZE_MAX := 32
const TILE_SIZE_PX := 32          # pixels per tile

# MISSION
const BASE_MISSION_DURATION := 90.0
const WAVE_INTERVAL := 15.0
const ENEMIES_PER_WAVE_BASE := 3
const WAVE_SCALE_FACTOR := 1.15

# HERO
const HERO_BASE_HP := 100
const HERO_BASE_ATTACK := 10
const HERO_BASE_ATTACK_SPEED := 1.0  # attacks per second
const HERO_BASE_ATTACK_RANGE := 2    # tiles
const HERO_MAX_LEVEL := 20

# XP
const XP_PER_KILL := 25
const XP_PER_HARVEST := 5
const XP_BASE_REQUIREMENT := 100
const XP_SCALE := 1.4

# DROPS
const DEATH_RESOURCE_KEEP := 0.25
const FRAGMENT_DROP_CHANCE := 0.07
const RARE_DROP_CHANCE := 0.05
const INGREDIENT_DROP_CHANCE := 0.4

# QUEST
const QUEST_POINTS_PER_RUN := 10
const BASE_QUEST_PERCENT := 0.10
const WHISPER_BONUS := 0.05

# ECONOMY
const CURRENCY_PER_KILL_BASE := 5
const CURRENCY_PER_WAVE := 25
const CURRENCY_PER_HARVEST := 2

# PROLOGUE
const HUNGER_DRAIN_INTERVAL := 5.0  # seconds
const HUNGER_DRAIN_AMOUNT := 1
const FIREPIT_WOOD_COST := 8
const FIREPIT_STONE_COST := 5
