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


func game_over(velocity_y: int):
	velocity.y = velocity_y
	gravity = 0
	$AnimatedSprite2D.stop()

