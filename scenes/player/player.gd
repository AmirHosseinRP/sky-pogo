class_name Player
extends CharacterBody3D

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var land_effect: AudioStreamPlayer3D = $LandEffect
@onready var fall_effect: AudioStreamPlayer3D = $FallEffect

const GRAVITY: float = 20
const JUMP_FORCE: float = 18
const MOVEMENT_SPEED: float = 6
const ROTATION_SPEED: float = 3
const FALL_OFF_THRESHOLD: float = -20

var start_height: float = 0.0
var score_height: float = 0.0


func _ready() -> void:
	start_height = position.y

	await get_tree().process_frame

	SignalHub.emit_new_height_reached(score_height)


func _physics_process(delta: float) -> void:
	hadle_gravity(delta)
	hadle_movement()
	handle_rotation(delta)

	move_and_slide()

	hadle_animation()
	hadle_death()
	update_best_height()


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


func hadle_death() -> void:
	if velocity.y < FALL_OFF_THRESHOLD && !fall_effect.playing:
		fall_effect.play()


func update_best_height() -> void:
	if position.y - start_height > score_height:
		score_height = position.y - start_height
		SignalHub.emit_new_height_reached(score_height)
