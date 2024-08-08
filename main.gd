extends Node

var pipe2

func _ready():
	var pipe = get_node("Pipes")
	pipe2 = $Pipes.duplicate()
	pipe.position.y = randf_range(-140.0, 200.0)
	pipe2.position.y = randf_range(-140.0, 200.0)
	pipe2.position.x = 550
	add_child(pipe)
	add_child(pipe2)

