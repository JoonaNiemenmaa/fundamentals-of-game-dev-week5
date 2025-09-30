extends Control

var player: Player
var score = 0;

func _ready() -> void:
	$HighScore.text = "Highscore: %s" % load_highscore()
	for child in get_tree().root.get_child(0).get_children():
		if child is Player:
			player = child

func load_highscore():
	var file = FileAccess.open("user://highscore.txt", FileAccess.READ)
	if file:
		var highscore = file.get_as_text()
		return highscore
	else:
		return "0"
	

func save_highscore(highscore: int):
	var file = FileAccess.open("user://highscore.txt", FileAccess.WRITE)
	file.store_string(str(highscore))

func _process(delta: float) -> void:
	if player:
		if player.position.y > -20:
			$Score.text = "Score: %s" % int(score)
			score += delta
		else:
			print(score)
			$HighScore.text = "Highscore: %s" % int(score)
			save_highscore(int(score))
