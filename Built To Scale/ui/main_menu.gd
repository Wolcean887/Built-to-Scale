extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	MusicController.play_menu_music()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://scenes/level.tscn")
	pass # Replace with function body.


func _on_options_btn_pressed():
	get_tree().change_scene_to_file("res://ui/options_menu.tscn")
	pass # Replace with function body.


func _on_credits_btn_pressed():
	get_tree().change_scene_to_file("res://ui/credits.tscn")
