class_name Player

extends CharacterBody3D

const GRAVITY: float = 20
const JUMP_FORCE: float = 15


func _physics_process(delta: float) -> void:
	if is_on_floor():
		velocity.y = JUMP_FORCE
	else:
		velocity.y -= GRAVITY * delta

	move_and_slide()
