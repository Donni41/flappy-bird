class_name Pipes extends Node2D

signal pipe_entered(body: Node2D)

func _on_upper_pipe_body_entered(body: Node2D):
	pipe_entered.emit(body)

func _on_lower_pipe_body_entered(body: Node2D):
	pipe_entered.emit(body)

func generate_position():
	position.y = randf_range(-140.0, 200.0)
	
func _process(delta):
	position.x -= 8
	if position.x < -1100:
		position.x = 0
		position.y = randf_range(-140.0, 200.0)

func _ready():
	print_debug("Ready ", self.name)
