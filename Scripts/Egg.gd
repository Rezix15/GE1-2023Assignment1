extends Node3D
var itemCount:int = 1

signal eggSelected(isSelected)

signal eggViewText(isHovering)

var eggText

# Called when the node enters the scene tree for the first time.
func _ready():
	itemCount = 1
	eggText = $EggText
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if itemCount <= 0:
		visible = false
	pass
	
	
func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			print("You clicked eggs")
			
			if itemCount > 0:
				itemCount = itemCount - 1
				emit_signal("eggSelected", true)
			
	pass # Replace with function body.
	


func _on_area_3d_mouse_entered():
	eggText.visible = true
	pass # Replace with function body.


func _on_area_3d_mouse_exited():
	eggText.visible = false
	pass # Replace with function body.
