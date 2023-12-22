extends Node3D

var hobMeshInstance
var hobMaterial
var OnColor
var defaultColor
# Called when the node enters the scene tree for the first time.
func _ready():
	hobMeshInstance = $MeshInstance3D
	hobMaterial = hobMeshInstance.material_override
	OnColor = Color(0.1, 0, 0)
	defaultColor = Color(0,0,0)
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_switch_stove_switch(status):
	if status == true:
		hobMaterial.albedo_color = OnColor
	else:
		hobMaterial.albedo_color = defaultColor
