class_name Spawner
extends Node

var platform_scene: PackedScene = preload("res://scenes/platform/platform.tscn")


func swapn_platform(old_platform_pos: Vector3) -> void:
	var new_platform: Platform = platform_scene.instantiate()

	new_platform.position = Vector3(old_platform_pos.x + 2, old_platform_pos.y + 5, old_platform_pos.z + 2)

	add_child(new_platform)


func _on_platform_player_landed(platform_pos: Vector3) -> void:
	swapn_platform(platform_pos)
