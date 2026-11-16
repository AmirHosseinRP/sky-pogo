class_name Hub
extends Control

@onready var score_label: Label = $MarginContainer/HBoxContainer/ScoreLabel
@onready var best_label: Label = $MarginContainer/HBoxContainer/BestLabel
@onready var game_over_screen: ColorRect = $GameOverScreen
@onready var new_best_label: Label = $GameOverScreen/CenterContainer/VBoxContainer/NewBestLabel

var high_score_resource: HighScoreResource = HighScoreResource.load_or_create()
var current_score: int = 0


func _enter_tree() -> void:
	SignalHub.new_height_reached.connect(_on_new_height_reached)
	SignalHub.game_over.connect(_on_game_over)


func _ready() -> void:
	best_label.text = "Best: " + str(high_score_resource.high_score)
	new_best_label.visible = false
	game_over_screen.visible = false


func _on_new_height_reached(new_height: float) -> void:
	current_score = int(new_height)
	score_label.text = "Score: " + str(current_score)


func _on_game_over() -> void:
	var is_new_high_score: bool = high_score_resource.chack_and_update(current_score)

	if is_new_high_score:
		new_best_label.text = "New Best Record: " + str(current_score)
		new_best_label.visible = true

	game_over_screen.visible = true


func _on_button_pressed() -> void:
	get_tree().call_deferred("reload_current_scene")
