class_name Platform
extends Node3D

signal player_landed(platform_pos: Vector3)

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var vanish_timer: Timer = $VanishTimer
@onready var area_3d: Area3D = $Area3D

const WAIT_TIME: float = 5.0
const WAIT_TIME_VARIANT: float = 1.5


func _ready() -> void:
	vanish_timer.wait_time = WAIT_TIME
	vanish_timer.wait_time += randf_range(-WAIT_TIME_VARIANT, WAIT_TIME_VARIANT)


func vanish() -> void:
	queue_free()


func _on_vanish_timer_timeout() -> void:
	animation_player.play("vanish")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "vanish":
		vanish()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Player:
		area_3d.body_entered.disconnect(_on_area_3d_body_entered)
		vanish_timer.start()
		player_landed.emit(position)
