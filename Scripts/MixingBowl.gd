extends Node3D

var itemBowl = []
signal mixItems()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true and itemBowl.size() >= 4:
			print("Mixing process")
			emit_signal("mixItems")
			
	pass # Replace with function body.


func _on_egg_egg_selected(isSelected):
	var egg1 = "Egg1"
	itemBowl.append(egg1) 
	pass # Replace with function body.


func _on_egg_2_egg_selected(isSelected):
	var egg2 = "Egg2"
	itemBowl.append(egg2)
	pass # Replace with function body.


func _on_flour_flour_clicked(isSelected):
	var flour = "Flour"
	itemBowl.append(flour)
	pass # Replace with function body.


func _on_milk_milk_clicked(isSelected):
	var milk = "Milk"
	itemBowl.append(milk)
	pass # Replace with function body.


func _on_area_3d_mouse_entered():
	print("You are hovering over the mixing bowl")
	
	if itemBowl.size() >= 4:
		print("Click to mix")
	pass # Replace with function body.
