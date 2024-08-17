extends CharacterBody2D

const JUMP_VELOCITY = -450.0


func _ready():
	$AnimatedSprite2D.play()

func _physics_process(delta):
	velocity.y += get_node("/root/Main").gravity * 0.70 * delta
	move_and_slide()
	$AnimatedSprite2D.rotation_degrees = velocity.y / 15
	$CollisionShape2D.rotation_degrees = velocity.y / 15

func _unhandled_input(event):
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				print("Left button was clicked at ", event.position)
				velocity.y = JUMP_VELOCITY
				$AudioStreamPlayer2D.pitch_scale = randf_range(2.0, 3.0)
				$AudioStreamPlayer2D.play()
		if event.button_index == MOUSE_BUTTON_RIGHT:
			if event.pressed:
				print("Right button was clicked at ", event.position)
				velocity.y += 150


func _on_ground_body_entered(body):
	velocity.y = 0
	get_node("/root/Main").gravity = 0
	print(get_node("/root/Main").score)
	$AnimatedSprite2D.stop()
	get_node("/root/Main/Pipes").set_process(false)
	get_node("/root/Main").pipe2.set_process(false)
	get_node("/root/Main/GameOver").show()
	if (!get_parent().game_ended):
		get_parent().game_ended = true
		$GameOver.play()

func _on_lower_pipe_body_entered(body):
	game_over_pipe()

func _on_upper_pipe_body_entered(body):
	game_over_pipe()

func game_over_pipe():
	velocity.y = 400
	get_node("/root/Main").gravity = 0
	print(get_node("/root/Main").score)
	$AnimatedSprite2D.stop()
	get_node("/root/Main/Pipes").set_process(false)
	get_node("/root/Main").pipe2.set_process(false)
	get_node("/root/Main/GameOver").show()
	if (!get_parent().game_ended):
		get_parent().game_ended = true
		$GameOver.play()
	


func _on_score_line_body_entered(body):
	get_node("/root/Main").score += 1
