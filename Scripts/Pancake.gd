extends Node3D
var basePancake
var pancakeMaterial
var pancakeTimer:=Timer.new()
var pancakeBurnTimer:=Timer.new()
var timerEnd:bool
var burnColor
var readyColor
var takeoutColor

signal pancakeClicked()

# Called when the node enters the scene tree for the first time.
func _ready():
	basePancake = get_node("RigidBody3D/pancakeMesh")
	pancakeMaterial = basePancake.material_override
	
	pancakeTimer.one_shot = true
	add_child(pancakeTimer)
	
	pancakeTimer.wait_time = 8.0
	timerEnd = false
	pancakeTimer.timeout.connect(_on_pancake_timer_timeout)
	
	pancakeTimer.start()
	
	pancakeBurnTimer.one_shot = true
	add_child(pancakeBurnTimer)
	
	pancakeBurnTimer.wait_time = 20.0
	pancakeBurnTimer.timeout.connect(_on_pancake_burn_timer_timeout)
	
	pancakeBurnTimer.start()
	
	burnColor = Color(0.09, 0.09, 0)
	readyColor = Color(1, 1, 0.53)
	takeoutColor = Color(1,1,0.59)
	
	pass # Replace with function body.
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var burningColor = Color(0.63, 0.61, 0)
	
	if pancakeBurnTimer.time_left >= 3.0 and pancakeBurnTimer.time_left <= 7.0:
		pancakeMaterial.albedo_color = burningColor
	pass


func _on_pancake_timer_timeout():
	pancakeMaterial.albedo_color = takeoutColor
	print("Takeout")
	timerEnd = true
	pass
	
func _on_pancake_burn_timer_timeout():
	pancakeMaterial.albedo_color = burnColor
	pass


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and timerEnd:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			print("Pancake clicked")
			emit_signal("pancakeClicked")
			pancakeBurnTimer.stop()
	pass # Replace with function body.


func _on_area_3d_mouse_entered():
	print("Hovering over pancake")
	pass # Replace with function body.
