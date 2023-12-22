extends Area3D

var canMix:bool

# Called when the node enters the scene tree for the first time.
func _ready():
	canMix = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_entered(area):
	if canMix:
		print(body_entered.get_name())


func _on_mixing_bowl_mix_items():
	canMix = true
	pass # Replace with function body.
