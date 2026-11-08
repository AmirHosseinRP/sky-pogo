extends Camera3D

@export var buffer: Vector3 = Vector3(0, 14, -8)
@export var movement_speed: float = 2.0

var base_position: Vector3


func _ready() -> void:
	base_position = position


func _process(delta: float) -> void:
	position = position.lerp(base_position, movement_speed * delta)


func _enter_tree() -> void:
	SignalHub.player_landed_on_platform.connect(_on_player_landed_on_platform)


func _on_player_landed_on_platform(platform_pos: Vector3) -> void:
	base_position = platform_pos + buffer
 
