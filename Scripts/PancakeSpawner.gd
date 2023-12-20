extends Node3D

var pancakeCount:int = 5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _spawnPancake():
	var item = load("res://DropScenes/dropPancake.tscn")
	var pancakeSpawn = item.instantiate()
	add_child(pancakeSpawn)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pan_pan_selected():
	if pancakeCount > 0:
		_spawnPancake()
	pass # Replace with function body.
