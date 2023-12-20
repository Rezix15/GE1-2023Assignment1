extends Camera3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("TurnRight"):
		global_position = Vector3(20, 15.873, 20)
		rotate_y(deg_to_rad(-90))
		# global_rotate(basis.y, -90)
		pass
	
	if Input.is_action_just_pressed("TurnLeft"):
		global_position = Vector3(0, 9.873, 11)
		rotate_y(deg_to_rad(90))
		pass
	pass
