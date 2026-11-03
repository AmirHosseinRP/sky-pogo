class_name Platform

extends Node3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer


func vanish() -> void:
	queue_free()


func _on_vanish_timer_timeout() -> void:
	animation_player.play("vanish")
