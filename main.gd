extends Node

var db : SQLite = null

var pipe2
var pipe
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var score = 0
var game_ended: bool = false

func _ready():
	pipe = get_node("Pipes")
	pipe2 = $Pipes.duplicate()
	pipe_position_reset()
	add_child(pipe)
	add_child(pipe2)
	$GameOver.hide()
	game_ended = false
	db = SQLite.new()
	db.path = "res://data.db"
	db.open_db()
	var table_dict : Dictionary
	table_dict["id"] = {"data_type":"int", "primary_key": true, "not_null": true, "auto_increment": true}
	table_dict["score"] = {"data_type":"int"}
	table_dict["date"] = {"data_type":"timestamp", "default": "CURRENT_TIMESTAMP"}
	db.create_table("Score", table_dict)
	
func new_game():
	pipe_position_reset()
	$CharacterBody2D.position = Vector2i(128, 77)
	gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
	$CharacterBody2D/AnimatedSprite2D.play()
	

func _on_button_pressed():
	get_node("/root/Main/Pipes").set_process(true)
	get_node("/root/Main").pipe2.set_process(true)
	$GameOver.hide()
	game_ended = false
	
	var data = {
		"score" = score,
	}
	
	db.insert_row("Score", data)
	print(data)
	new_game()
	score = 0

func _process(delta):
	$Label.text = str(score)
	
func pipe_position_reset():
	pipe.position.y = randf_range(-140.0, 200.0)
	pipe.position.x = 0
	pipe2.position.y = randf_range(-140.0, 200.0)
	pipe2.position.x = 550


func _on_back_button_pressed():
	var data = {
		"score" = score,
	}
	
	db.insert_row("Score", data)
	get_tree().change_scene_to_file("res://StartUp.tscn")
