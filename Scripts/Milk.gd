extends Node3D

var itemCount:int = 1
signal milkClicked(isSelected)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			print("You clicked the milk bottle")
			emit_signal("milkClicked", true)
					
			if itemCount > 0:	
				itemCount = itemCount - 1
			else:
				print("Milk bottle is empty")
	pass # Replace with function body.


func _on_area_3d_mouse_entered():
	print("You are hovering over the milk bottle")
	pass # Replace with function body.
