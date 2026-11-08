extends Node

signal player_landed_on_platform(platform_position: Vector3)


func emit_player_landed_on_platform(platform_position: Vector3) -> void:
	player_landed_on_platform.emit(platform_position)
