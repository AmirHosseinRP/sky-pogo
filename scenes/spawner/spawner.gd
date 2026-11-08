class_name Spawner
extends Node

var platform_scene: PackedScene = preload("res://scenes/platform/platform.tscn")


func _enter_tree() -> void:
	SignalHub.player_landed_on_platform.connect(_on_player_landed_on_platform)


func _on_player_landed_on_platform(platform_pos: Vector3) -> void:
	var new_platform: Platform = platform_scene.instantiate()
	new_platform.position = Vector3(platform_pos.x + 2, platform_pos.y + 5, platform_pos.z + 2)

	add_child(new_platform)
