extends Node3D
var pancakeTimer:=Timer.new()
var timerEnd:bool
var targetColor
var currentColor

signal pancakeClicked()

# Called when the node enters the scene tree for the first time.
func _ready():
	pancakeTimer.one_shot = true
	add_child(pancakeTimer)
	
	pancakeTimer.wait_time = 8.0
	timerEnd = false
	pancakeTimer.timeout.connect(_on_pancake_timer_timeout)
	
	pancakeTimer.start()
	
	targetColor = Color(0.09, 0.09, 0)
	currentColor = Color(1, 1, 0.53)
	
	pass # Replace with function body.

func color_distance(colorA: Color, colorB: Color, time:float) -> float:
	return sqrt(pow(colorA.r - colorB.r, 2) + pow(colorA.g - colorB.g, 2) + pow(colorA.b - colorB.b, 2) * (time/10))
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var basePancake = get_node("RigidBody3D/pancakeMesh")
	var pancakeMaterial = basePancake.material_override
	
	
	while color_distance(currentColor, targetColor, delta) >= 0.1:
		currentColor = currentColor.lerp(targetColor, 0.1)
		pancakeMaterial.albedo_color = currentColor


func _on_pancake_timer_timeout():
	print("Takeout")
	timerEnd = true
	pass


func _on_area_3d_input_event(camera, event, position, normal, shape_idx):
	if event is InputEventMouseButton and timerEnd:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed == true:
			print("Pancake clicked")
			emit_signal("pancakeClicked")
	pass # Replace with function body.


func _on_area_3d_mouse_entered():
	print("Hovering over pancake")
	pass # Replace with function body.
