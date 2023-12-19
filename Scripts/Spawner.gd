extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func _spawnFlour():
	var item = load("res://DropScenes/dropFlour.tscn")
	var flourSpawn = item.instantiate()
	add_child(flourSpawn)

func _spawnEgg():
	var item = load("res://DropScenes/dropEgg.tscn")
	var flourSpawn = item.instantiate()
	add_child(flourSpawn)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_flour_flour_clicked(isSelected):
	if isSelected == true:
		_spawnFlour()
		isSelected = false
	pass # Replace with function body.


func _on_egg_egg_selected(isSelected):
	if isSelected == true:
		_spawnEgg()
		isSelected = false
	pass # Replace with function body.


func _on_egg_2_egg_selected(isSelected):
	if isSelected == true:
		_spawnEgg()
		isSelected = false
	pass # Replace with function body.
