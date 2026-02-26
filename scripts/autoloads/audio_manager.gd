extends Node

# ============================================================
# AUDIO MANAGER — Stub for POC phase
# All functions are no-ops until audio files are integrated.
# Source: Session Guide Section 5.3
#
# Integration steps (post-POC):
# 1. Import audio files to res://assets/audio/
# 2. Add AudioStreamPlayer nodes to this scene
# 3. Implement play_sfx() and play_music() with real streams
# ============================================================


func play_sfx(sound_key: String) -> void:
	pass  # Stub


func play_music(track_key: String) -> void:
	pass  # Stub


func stop_music() -> void:
	pass  # Stub


func set_sfx_volume(volume: float) -> void:
	pass  # Stub


func set_music_volume(volume: float) -> void:
	pass  # Stub
