extends Node3D

var cycleRot:float = 0
var status:bool
signal stoveSwitch(status)
var audioPlayer
# Called when the node enters the scene tree for the first time.
func _ready():
	status = false
	audioPlayer = $AudioStreamPlayer3D
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if status == true:
		audioPlayer.play()
		cycleRot = deg_to_rad(180)
		global_rotation = Vector3(0, 0, cycleRot)
	else:
		cycleRot = deg_to_rad(0)
		global_rotation = Vector3(0, 0, cycleRot)
	pass


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			status = !status
			emit_signal("stoveSwitch", status)
	pass # Replace with function body.


func _on_area_3d_mouse_entered():
	print("Stove Switch")
	pass # Replace with function body.
