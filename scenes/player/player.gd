class_name Player

extends CharacterBody3D

const GRAVITY: float = 20


func _physics_process(delta: float) -> void:
	velocity.y -= GRAVITY * delta

	move_and_slide()
