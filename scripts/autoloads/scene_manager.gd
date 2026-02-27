extends Node

# ============================================================
# SCENE MANAGER — Scene transitions and routing
# Source: Build Bible v1 Section 9.1
# ============================================================

var _current_scene: Node = null


func go_to(scene_path: String, transition: String = 'fade') -> void:
	# Fade out, load new scene, fade in
	if _current_scene:
		_current_scene.queue_free()
	var new_scene = load(scene_path).instantiate()
	get_tree().root.add_child(new_scene)
	_current_scene = new_scene
	GameState.screen = scene_path.get_file().get_basename()
