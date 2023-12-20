extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_spawner_milk_drop_ended(status):
	visible = true
	pass # Replace with function body.

func color_distance(colorA: Color, colorB: Color) -> float:
	return sqrt(pow(colorA.r - colorB.r, 2) + pow(colorA.g - colorB.g, 2) + pow(colorA.b - colorB.b, 2))

func _on_mixing_bowl_mix_items():
	var baseMilk = $BaseMilk2
	var milkMaterial = baseMilk.material_override
	var targetColor = Color(1, 1, 0.53)
	var currentColor = Color(1, 1, 1)
	
	
	while color_distance(currentColor, targetColor) > 0.1:
		currentColor = currentColor.lerp(targetColor, 0.001)
		milkMaterial.albedo_color = currentColor
		
	pass # Replace with function body.
