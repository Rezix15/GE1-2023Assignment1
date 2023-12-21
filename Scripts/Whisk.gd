extends Node3D

var moveTowardsMouse:bool

signal gravityStatus(status:bool)

# Called when the node enters the scene tree for the first time.
func _ready():
	moveTowardsMouse = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _physics_process(delta):
	if moveTowardsMouse:
		emit_signal("gravityStatus", false)
		global_position = ScreenPointToRay()
		
	else:
		emit_signal("gravityStatus", true)

func _on_rigid_body_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			print("You clicked the whisk")
			moveTowardsMouse = true
		elif event.button_index == MOUSE_BUTTON_RIGHT and moveTowardsMouse == true:
			print("You dropped this")
			moveTowardsMouse = false


func ScreenPointToRay():
	var spaceState = get_world_3d().direct_space_state
	var mousePos = get_viewport().get_mouse_position()
	var camera = get_tree().root.get_camera_3d()
	var rayOrigin = camera.project_ray_origin(mousePos)
	
	var rayEnd = rayOrigin + camera.project_ray_normal(mousePos) * 2000
	var rayArray = spaceState.intersect_ray(PhysicsRayQueryParameters3D.create(rayOrigin, rayEnd))
	
	if rayArray.has("position"):
		print(rayArray["position"])
		return rayArray["position"]
		
	return Vector3()
		
func _on_rigid_body_3d_mouse_entered():
	print("Hovering over whisk")
