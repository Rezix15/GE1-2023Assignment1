extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func spawnDroplet():
	var droplet = load("res://DropScenes/dropMilkDroplet.tscn")
	var milkDroplet = droplet.instantiate()
	add_child(milkDroplet)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	spawnDroplet()
	pass # Replace with function body.
	
