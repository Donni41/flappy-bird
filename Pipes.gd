extends Node2D

func generate_position():
	position.y = randf_range(-140.0, 200.0)
	
func _process(delta):
	position.x -= 8
	if (position.x < -1100):
		position.x = 0
		position.y = randf_range(-140.0, 200.0)
