extends Control

@onready var score_label: Label = $MarginContainer/HBoxContainer/ScoreLabel


func _enter_tree() -> void:
	SignalHub.new_height_reached.connect(_on_new_height_reached)


func _on_new_height_reached(new_height: float) -> void:
	score_label.text = "Score: " + str(int(new_height))
