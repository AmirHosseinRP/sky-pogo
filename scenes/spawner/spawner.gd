class_name Spawner
extends Node

const OFFSET_UP: Vector2 = Vector2(2, 5.0)
const OFFSET_SIDE: Vector2 = Vector2(1.7, 3.7)

@export var platform_scenes_list: Array[PackedScene]


func _enter_tree() -> void:
	SignalHub.player_landed_on_platform.connect(_on_player_landed_on_platform)


func get_random_offset(offset_range: Vector2) -> float:
	if randf() < 0.5:
		return randf_range(-offset_range.y, offset_range.x)
	else:
		return randf_range(offset_range.x, offset_range.y)


func _on_player_landed_on_platform(platform_pos: Vector3) -> void:
	if platform_scenes_list.size() == 0:
		return

	var platform_scene: PackedScene = platform_scenes_list.pick_random()
	var new_platform: Platform = platform_scene.instantiate()

	var new_positions: Vector3 = Vector3(
		get_random_offset(OFFSET_SIDE),
		randf_range(OFFSET_UP.x, OFFSET_UP.y),
		get_random_offset(OFFSET_SIDE)
	)

	new_platform.position = platform_pos + new_positions

	add_child(new_platform)
