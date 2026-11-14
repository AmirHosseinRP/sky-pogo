extends Node

signal player_landed_on_platform(platform_position: Vector3)
signal new_height_reached(new_height: float)


func emit_player_landed_on_platform(platform_position: Vector3) -> void:
	player_landed_on_platform.emit(platform_position)


func emit_new_height_reached(new_height: float) -> void:
	new_height_reached.emit(new_height)
