extends Node3D

var cycleRot:float = 0
var status:bool
signal stoveSwitch(status)
# Called when the node enters the scene tree for the first time.
func _ready():
	status = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if status == true:
		emit_signal("stoveSwitch", true)
	pass


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			cycleRot += deg_to_rad(180)
			rotate_z(cycleRot)
			print(rad_to_deg(cycleRot))
			status = !status
			print(status)
			
	pass # Replace with function body.


func _on_area_3d_mouse_entered():
	print("Stove Switch")
	pass # Replace with function body.
