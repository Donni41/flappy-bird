extends Node

func _ready():
	var pipe = get_node("Pipes")
	var pipe2 = $Pipes.new()
	pipe.position.y = randf_range(-140.0, 200.0)
	add_child(pipe)
	add_child(pipe2)

