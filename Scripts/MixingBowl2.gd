extends Node3D
var hasMixed:bool

# Called when the node enters the scene tree for the first time.
func _ready():
	if hasMixed == false:
		visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_mixing_bowl_mix_items():
	hasMixed = true
	visible = true
	pass # Replace with function body.
