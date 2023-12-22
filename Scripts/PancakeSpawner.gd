extends Node3D

var pancakeCount:int = 5

var pancakeSpawn

var hasMixed:bool

var scoreText
var objectiveText

var score

var isFinished

#var pancakeScore

signal batterEmpty()
# Called when the node enters the scene tree for the first time.
func _ready():
	hasMixed = false
	
	scoreText = get_node("../../../Control/ScorePanel/ScoreText")
	objectiveText = get_node("../../../Control/ObjectivePanel/CurrentObjectiveText")


func _spawnPancake():
	var item = load("res://DropScenes/dropPancake.tscn")
	pancakeSpawn = item.instantiate()
	add_child(pancakeSpawn)
	
	pancakeSpawn.connect("pancakeClicked", _on_pancake_clicked)


func _on_pancake_clicked(pancakeScore):
	pancakeSpawn.transform.origin = Vector3(0, 4, 10)
	score += pancakeScore
	
	
	if isFinished and score >= 700:
		objectiveText.text = "All tasks completed. Enjoy your perfect delicious pancakes!"
	elif isFinished and score >= 100 and score < 200:
		objectiveText.text = "All tasks completed. Enjoy those burnt pancakes!"
	elif isFinished and score >= 500 and score < 700:
		objectiveText.text = "All tasks completed. Enjoy your delicious pancakes!"
	elif isFinished and score >= 350 and score < 500:
		objectiveText.text = "All tasks completed. Enjoy your pancakes with the effort you put in!"
	elif isFinished and score >= 200 and score < 350:
		objectiveText.text = "All tasks completed. Enjoy those poor pancakes !"	
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if hasMixed:
		scoreText.text = str(score)
	if pancakeCount == 0:
		emit_signal("batterEmpty")
		isFinished = true


func _on_pan_pan_selected():
	if pancakeCount > 0 and hasMixed:
		_spawnPancake()
		pancakeCount -= 1
		print(pancakeCount)
	pass # Replace with function body.


func _on_mixing_bowl_mix_items():
	score = int(scoreText.text)
	if !hasMixed:
		score += 100
	hasMixed = true
	pass # Replace with function body.

