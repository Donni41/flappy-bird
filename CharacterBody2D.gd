extends CharacterBody2D

const JUMP_VELOCITY = -450.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	$AnimatedSprite2D.play()

func _physics_process(delta):
	velocity.y += gravity * 0.70 * delta
	move_and_slide()

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				print("Left button was clicked at ", event.position)
				velocity.y = JUMP_VELOCITY
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				print("Right button was clicked at ", event.position)
				velocity.y += 150


func _on_ground_body_entered(body):
	velocity.y = 0
	gravity = 0
	print("game_over")
	$AnimatedSprite2D.stop()
	get_node("/root/Main/Pipes").set_process(false)

func _on_lower_pipe_body_entered(body):
	game_over_pipe()

func _on_upper_pipe_body_entered(body):
	game_over_pipe()

func game_over_pipe():
	velocity.y = 400
	gravity = 0
	print("game_over")
	$AnimatedSprite2D.stop()
	get_node("/root/Main/Pipes").set_process(false)
