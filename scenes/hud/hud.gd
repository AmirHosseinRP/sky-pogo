extends Control

@onready var score_label: Label = $MarginContainer/HBoxContainer/ScoreLabel
@onready var best_label: Label = $MarginContainer/HBoxContainer/BestLabel

var high_score_resource: HighScoreResource = HighScoreResource.load_or_create()
var current_score: int = 0


func _enter_tree() -> void:
	SignalHub.new_height_reached.connect(_on_new_height_reached)
	SignalHub.game_over.connect(_on_game_over)


func _ready() -> void:
	best_label.text = "Best: " + str(high_score_resource.high_score)


func _on_new_height_reached(new_height: float) -> void:
	current_score = int(new_height)
	score_label.text = "Score: " + str(current_score)


func _on_game_over() -> void:
	high_score_resource.chack_and_update(current_score)
