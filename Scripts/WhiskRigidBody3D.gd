extends RigidBody3D


# Called when the node enters the scene tree for the first time.
func _ready():
	gravity_scale = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_whisk_gravity_status(status):
	if status == true:
		gravity_scale = 1
	else:
		gravity_scale = 0
	pass # Replace with function body.
