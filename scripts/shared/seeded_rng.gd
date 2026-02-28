extends RefCounted
class_name SeededRNG

# ============================================================
# SEEDED RNG — XOR-shift deterministic random number generator
# Source: Build Bible v1 Section 3.4
# ============================================================

var _seed: int


func _init(seed_val: int) -> void:
	_seed = seed_val


func next() -> float:
	_seed = (_seed ^ (_seed << 13)) & 0x7FFFFFFF
	_seed = (_seed ^ (_seed >> 17)) & 0x7FFFFFFF
	_seed = (_seed ^ (_seed << 5)) & 0x7FFFFFFF
	return float(_seed) / float(0x7FFFFFFF)


func next_int(min_val: int, max_val: int) -> int:
	return min_val + int(next() * (max_val - min_val + 1))
