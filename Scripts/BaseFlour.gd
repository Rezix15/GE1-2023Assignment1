extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_flour_flour_status(isEmpty):
	if isEmpty == true:
		visible = false
		
	pass # Replace with function body.
