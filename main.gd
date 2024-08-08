extends Node

var pipes_scene := load("res://pipes.tscn")

var pipe1: Pipes
var pipe2: Pipes

func _ready():
	pipe1 = spawn_pipe("Pipe 1", 0)
	pipe2 = spawn_pipe("Pipe 2", 550)
	$Ground.connect("body_entered", on_ground_collision)

func spawn_pipe(name: String, position_x: int) -> Pipes:
	var pipe: Pipes = pipes_scene.instantiate()
	pipe.connect("pipe_entered", on_pipes_collision)
	pipe.name = name
	pipe.position.x = position_x
	pipe.position.y = randf_range(-140.0, 200.0)
	add_child(pipe)
	return pipe

func on_ground_collision(ground_collided_with: Node2D):
	if ground_collided_with == $CharacterBody2D:
		game_over(0)

func on_pipes_collision(pipes_collided_with: Node2D):
	if pipes_collided_with == $CharacterBody2D:
		game_over(400)

func game_over(velocity_y: int):
	$CharacterBody2D.game_over(velocity_y)
	pipe1.set_process(false)
	pipe2.set_process(false)
