extends Node3D

var itemBowl = []
signal mixItems()
signal readyToMix()
var hasMixed:bool
var mixed:bool
var score:int = 0
var scoreText
var objectiveText

# Called when the node enters the scene tree for the first time.
func _ready():
	mixed = false
	scoreText = get_node("../Control/ScorePanel/ScoreText")
	objectiveText = get_node("../Control/ObjectivePanel/CurrentObjectiveText")
	
	objectiveText.text = "1.  Add Ingredients To The Mixing Bowl"
	hasMixed = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if !hasMixed:
		scoreText.text = str(score)
		
	if itemBowl.size() >= 4 and mixed == false and hasMixed == false:
		objectiveText.text = "2. Stir the batter with the whisk"
		emit_signal("readyToMix")


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true and itemBowl.size() >= 4:
			pass


func _on_egg_egg_selected(isSelected):
	var egg1 = "Egg1"
	itemBowl.append(egg1)
	score += 10 
	


func _on_egg_2_egg_selected(isSelected):
	var egg2 = "Egg2"
	itemBowl.append(egg2)
	score += 10
	


func _on_flour_flour_clicked(isSelected):
	var flour = "Flour"
	itemBowl.append(flour)
	score += 10
	


func _on_milk_milk_clicked(isSelected):
	var milk = "Milk"
	itemBowl.append(milk)
	score += 10



func _on_area_3d_mouse_entered():
	print("You are hovering over the mixing bowl")
	
	if itemBowl.size() >= 4 and mixed == false:
		print("Click to mix")


func _on_whisk_mix_items():
	print("Mixing process")
	mixed = true
	emit_signal("mixItems")
	if hasMixed == false:
		hasMixed = true
		objectiveText.text = "3. Move to the right and fry your pancakes on the pan"
