class_name HighScoreResource
extends Resource

@export var high_score: int = 0

const SCORES_PATH: String = "user://skypogo.tres"


static func load_or_create() -> HighScoreResource:
	var high_score_resource: HighScoreResource = null

	if ResourceLoader.exists(SCORES_PATH):
		high_score_resource = load(SCORES_PATH)

		if high_score_resource:
			return high_score_resource

	high_score_resource = HighScoreResource.new()
	high_score_resource.save()

	return high_score_resource


func save() -> void:
	ResourceSaver.save(self, SCORES_PATH)


func chack_and_update(score: int) -> bool:
	if score > high_score:
		high_score = score
		save()
		return true
	return false
