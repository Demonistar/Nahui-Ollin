extends RefCounted
class_name MapGenerator

# ============================================================
# MAP GENERATOR — Procedural map generation
# Source: Build Bible v1 Section 3.5
# Ground tile weights: GDD Section 3.2
# Resource node tiers: GDD Section 3.3
# Resource density: ~17% in clusters of 2-5 per GDD Section 3.2
# ============================================================

# --- Ground tile types and weights ---
# Source: Build Bible Section 3.5 / GDD Section 3.2
const GROUND_TYPES := ["grassland", "forest", "rocky", "wetland", "farmland"]
const GROUND_WEIGHTS := [40, 25, 20, 10, 5]  # Must sum to 100

# --- Resource node tier chances by wave ---
# Source: GDD Section 3.3
# common: always; uncommon: always; rare: wave 3+; epic: wave 6+; legendary: wave 10+
const TIER_HARVEST_TIMES := {
	"common": 0.0,
	"uncommon": 1.0,
	"rare": 2.0,
	"epic": 3.0,
	"legendary": 5.0,
}

# Resource node types by ground tile
# Source: GDD Section 3.2
const GROUND_RESOURCES := {
	"grassland": ["herb", "fiber", "grain"],
	"forest": ["wood", "mushroom", "bark"],
	"rocky": ["stone", "copper", "iron"],
	"wetland": ["water_plant", "clay", "reed"],
	"farmland": ["corn", "bean", "squash"],
}


static func generate_map(grid_size: int, seed_val: int, wave: int) -> Array:
	# Returns a 2D Array[Array[Dictionary]] of cell data
	# Source: Build Bible Section 3.5
	var rng := SeededRNG.new(seed_val)
	var map: Array = []

	for y in range(grid_size):
		var row: Array = []
		for x in range(grid_size):
			row.append(_make_ground_cell(x, y, rng))
		map.append(row)

	_place_resource_clusters(map, grid_size, rng, wave)

	return map


static func _pick_ground_type(rng: SeededRNG) -> String:
	var roll := rng.next_int(1, 100)
	var cumulative := 0
	for i in range(GROUND_TYPES.size()):
		cumulative += GROUND_WEIGHTS[i]
		if roll <= cumulative:
			return GROUND_TYPES[i]
	return GROUND_TYPES[0]


static func _make_ground_cell(x: int, y: int, rng: SeededRNG) -> Dictionary:
	var ground_type := _pick_ground_type(rng)
	return {
		"x": x,
		"y": y,
		"ground": ground_type,
		"resource": null,
	}


static func _place_resource_clusters(map: Array, grid_size: int, rng: SeededRNG, wave: int) -> void:
	# Target ~17% resource node density in clusters of 2-5
	# Source: GDD Section 3.2
	var target_count := int(grid_size * grid_size * 0.17)
	var placed := 0

	var attempts := 0
	while placed < target_count and attempts < grid_size * grid_size * 4:
		attempts += 1
		var cx := rng.next_int(0, grid_size - 1)
		var cy := rng.next_int(0, grid_size - 1)
		var cluster_size := rng.next_int(2, 5)

		for _i in range(cluster_size):
			if placed >= target_count:
				break
			var ox := rng.next_int(-1, 1)
			var oy := rng.next_int(-1, 1)
			var tx := clamp(cx + ox, 0, grid_size - 1)
			var ty := clamp(cy + oy, 0, grid_size - 1)
			if map[ty][tx].resource == null:
				map[ty][tx].resource = _pick_resource(map[ty][tx].ground, rng, wave)
				placed += 1


static func _pick_resource(ground_type: String, rng: SeededRNG, wave: int) -> Dictionary:
	var tier := _pick_tier(rng, wave)
	var resource_pool: Array = GROUND_RESOURCES.get(ground_type, ["wood"])
	var resource_type: String = resource_pool[rng.next_int(0, resource_pool.size() - 1)]
	return {
		"type": resource_type,
		"tier": tier,
		"harvest_time": TIER_HARVEST_TIMES[tier],
		"depleted": false,
	}


static func _pick_tier(rng: SeededRNG, wave: int) -> String:
	# Source: GDD Section 3.3
	# legendary: 1% at wave 10+; epic: 4% at wave 6+; rare: 10% at wave 3+
	# uncommon: 25%; common: remainder
	var roll := rng.next() * 100.0

	if wave >= 10 and roll < 1.0:
		return "legendary"
	if wave >= 6 and roll < 5.0:
		return "epic"
	if wave >= 3 and roll < 15.0:
		return "rare"
	if roll < 40.0:
		return "uncommon"
	return "common"
