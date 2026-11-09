class_name Player
extends CharacterBody3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var land_effect: AudioStreamPlayer3D = $LandEffect

const GRAVITY: float = 20
const JUMP_FORCE: float = 18
const MOVEMENT_SPEED: float = 6
const ROTATION_SPEED: float = 3


func _physics_process(delta: float) -> void:
	hadle_gravity(delta)
	hadle_movement()
	handle_rotation(delta)

	move_and_slide()

	hadle_animation()


func hadle_gravity(delta: float) -> void:
	if is_on_floor():
		velocity.y = JUMP_FORCE
		land_effect.play()
	else:
		velocity.y -= GRAVITY * delta


func hadle_movement() -> void:
	velocity.x = 0
	velocity.z = 0

	var direction: Vector3 = transform.basis.z

	if Input.is_action_pressed("move_forward"):
		velocity.x = direction.x * MOVEMENT_SPEED
		velocity.z = direction.z * MOVEMENT_SPEED
	if Input.is_action_pressed("move_backward"):
		velocity.x = -direction.x * MOVEMENT_SPEED
		velocity.z = -direction.z * MOVEMENT_SPEED


func handle_rotation(delta: float) -> void:
	if Input.is_action_pressed("move_right"):
		rotation.y -= ROTATION_SPEED * delta
	if Input.is_action_pressed("move_left"):
		rotation.y += ROTATION_SPEED * delta


func hadle_animation() -> void:
	if velocity.y > 0:
		animation_player.play("jump")
	else:
		animation_player.play("fall")
