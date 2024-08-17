extends Control

var db : SQLite = null

func _ready():
	db = SQLite.new()
	db.path = "res://data.db"
	db.open_db()
	var table_dict : Dictionary
	table_dict["id"] = {"data_type":"int", "primary_key": true, "not_null": true, "auto_increment": true}
	table_dict["score"] = {"data_type":"int"}
	table_dict["date"] = {"data_type":"timestamp", "default": "CURRENT_TIMESTAMP"}
	db.create_table("Score", table_dict)
	var query_string : String = "SELECT score, date FROM Score WHERE score > 0 ORDER BY score DESC LIMIT 10;"
	var success = db.query(query_string)
	if (success):
		for score in db.query_result:
			$VBoxContainer/Label.text += str(score.score)
			$VBoxContainer/Label.text += " earned "
			$VBoxContainer/Label.text += str(score.date)
			$VBoxContainer/Label.text += "\n"
	

func _on_button_pressed():
	get_tree().change_scene_to_file("res://StartUp.tscn")
