extends Node3D

var pancakeCount:int = 5

var pancakeSpawn

# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


func _spawnPancake():
	var item = load("res://DropScenes/dropPancake.tscn")
	pancakeSpawn = item.instantiate()
	add_child(pancakeSpawn)
	
	pancakeSpawn.connect("pancakeClicked", _on_pancake_clicked)


func _on_pancake_clicked():
	pancakeSpawn.global_transform.origin = Vector3(25.532, 4, 23.211)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pan_pan_selected():
	if pancakeCount > 0:
		_spawnPancake()
		pancakeCount -= 1
		print(pancakeCount)
	pass # Replace with function body.
