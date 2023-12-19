extends Node3D

var isMilkSpawning:bool
var milkTimer:=Timer.new()

var flourSpawn
var eggSpawn
var milkSpawn

signal MilkDropEnded(status)

# Called when the node enters the scene tree for the first time.
func _ready():
	milkTimer.one_shot = true
	add_child(milkTimer)
	
	milkTimer.wait_time = 4.0
	
	milkTimer.timeout.connect(_on_milk_timer_timeout)
	pass


func _spawnFlour():
	var item = load("res://DropScenes/dropFlour.tscn")
	flourSpawn = item.instantiate()
	add_child(flourSpawn)

func _spawnEgg():
	var item = load("res://DropScenes/dropEgg.tscn")
	eggSpawn = item.instantiate()
	add_child(eggSpawn)
	
func _spawnMilk():
	var item = load("res://DropScenes/dropMilk.tscn")
	milkSpawn = item.instantiate()
	add_child(milkSpawn)
	isMilkSpawning = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(milkTimer.time_left)
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


func _on_milk_milk_clicked(isSelected):
	_spawnMilk()
	if isMilkSpawning:
		milkTimer.start()
	pass # Replace with function body.


func _on_milk_timer_timeout():
	emit_signal("MilkDropEnded", true)
	remove_child(milkSpawn)
	isMilkSpawning = false
	pass # Replace with function body.
