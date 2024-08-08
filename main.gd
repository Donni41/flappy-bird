extends Node

var pipe2
var pipe
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var score = 0

func _ready():
	pipe = get_node("Pipes")
	pipe2 = $Pipes.duplicate()
	pipe_position_reset()
	add_child(pipe)
	add_child(pipe2)
	$GameOver.hide()
	
func new_game():
	pipe_position_reset()
	$CharacterBody2D.position = Vector2i(128, 77)
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	

func _on_button_pressed():
	get_node("/root/Main/Pipes").set_process(true)
	get_node("/root/Main").pipe2.set_process(true)
	$GameOver.hide()
	new_game()
	score = 0

func _process(delta):
	$Label.text = str(score)
	
func pipe_position_reset():
	pipe.position.y = randf_range(-140.0, 200.0)
	pipe.position.x = 0
	pipe2.position.y = randf_range(-140.0, 200.0)
	pipe2.position.x = 550
