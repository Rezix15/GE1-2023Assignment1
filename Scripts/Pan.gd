extends Node3D

signal panSelected()

var audioPlayer

var isStoveOn:bool

# Called when the node enters the scene tree for the first time.
func _ready():
	audioPlayer = $AudioStreamPlayer
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed and isStoveOn:
			emit_signal("panSelected")

func _on_area_3d_mouse_entered():
	pass # Replace with function body.


func _on_area_3d_body_entered(body):
	if body.name == "RigidBody3D" and isStoveOn:
		audioPlayer.play()
	


func _on_area_3d_body_exited(body):
	if body.name == "RigidBody3D" and isStoveOn:
		audioPlayer.stop()


func _on_switch_stove_switch(status):
	isStoveOn = status
