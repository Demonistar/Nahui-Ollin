extends Node2D

# ============================================================
# TILEMAP — POC colored-rectangle map renderer
# Source: Build Bible v1 Section 3.2 (colors), Section 3.5 (render)
# All visuals are ColorRect placeholders — no sprites in POC phase.
# ============================================================

# --- Ground tile colors ---
# Source: Build Bible Section 3.2
const GROUND_COLORS := {
	"grassland": Color(0.1, 0.15, 0.05),
	"forest": Color(0.1, 0.2, 0.1),
	"rocky": Color(0.3, 0.3, 0.3),
	"wetland": Color(0.05, 0.15, 0.2),
	"farmland": Color(0.2, 0.15, 0.05),
}

# --- Resource node overlay colors ---
# Source: Build Bible Section 3.2
const NODE_COLORS := {
	"common": Color(0.6, 0.8, 0.4),
	"uncommon": Color(0.3, 0.6, 0.9),
	"rare": Color(0.7, 0.3, 0.9),
	"epic": Color(0.9, 0.5, 0.1),
	"legendary": Color(0.95, 0.85, 0.1),
}

@onready var _tile_container: Node2D = $TileContainer
@onready var _camera: Camera2D = $Camera2D


func render(map_data: Array) -> void:
	var grid_size: int = map_data.size()
	var tile_px: int = GameConfig.TILE_SIZE_PX

	for child in _tile_container.get_children():
		child.queue_free()

	for y in range(grid_size):
		for x in range(grid_size):
			var cell: Dictionary = map_data[y][x]
			_draw_cell(cell, x, y, tile_px)

	var center := float(grid_size * tile_px) / 2.0
	_camera.position = Vector2(center, center)


func _draw_cell(cell: Dictionary, x: int, y: int, tile_px: int) -> void:
	var ground_rect := ColorRect.new()
	ground_rect.size = Vector2(tile_px - 1, tile_px - 1)
	ground_rect.position = Vector2(x * tile_px, y * tile_px)
	ground_rect.color = GROUND_COLORS.get(cell.ground, Color(0.1, 0.1, 0.1))
	_tile_container.add_child(ground_rect)

	if cell.resource != null:
		var node_rect := ColorRect.new()
		var node_size := float(tile_px) / 2.0
		var node_offset := float(tile_px) / 4.0
		node_rect.size = Vector2(node_size, node_size)
		node_rect.position = Vector2(x * tile_px + node_offset, y * tile_px + node_offset)
		node_rect.color = NODE_COLORS.get(cell.resource.tier, Color(1, 1, 1))
		_tile_container.add_child(node_rect)
