extends Node


func _on_death_zone_body_entered(body: Node3D) -> void:
	if body is Player:
		SignalHub.emit_game_over()
