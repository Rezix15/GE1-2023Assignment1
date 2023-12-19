extends Node3D
var itemCount:int = 1

signal flourClicked(isSelected)
signal flourStatus(isEmpty)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if itemCount <= 0:
		emit_signal("flourStatus", true)
	pass

func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			print("You clicked flour")
					
			if itemCount > 0:	
				itemCount = itemCount - 1
				emit_signal("flourClicked", true)
			else:
				print("No more flour left")
			
	pass # Replace with function body.


func _on_area_3d_mouse_entered():
	print("You are hovering over Flour")
	pass # Replace with function body.
