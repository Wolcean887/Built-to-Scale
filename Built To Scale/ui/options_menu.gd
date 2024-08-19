extends Control

var offset = 0.15

func _ready():
	#get current slider vals from volumes
	var volume_val = snapped(db_to_linear(AudioServer.get_bus_volume_db(0)/offset),0.01)
	var music_val = snapped(db_to_linear(AudioServer.get_bus_volume_db(1)/offset),0.01)
	var sfx_val = snapped(db_to_linear(AudioServer.get_bus_volume_db(2)/offset),0.01)
	
	#initialise sliders to current vals
	$MarginContainer/VBoxContainer/SoundGridContainer/VolumeSlider.value = volume_val
	$MarginContainer/VBoxContainer/SoundGridContainer/MusicSlider.value = music_val
	$MarginContainer/VBoxContainer/SoundGridContainer/SFXSlider.value = sfx_val
	
	print(music_val)

func _on_volume_slider_value_changed(value):
	AudioServer.set_bus_volume_db(0,linear_to_db(value)*offset) #can offset value if needed


func _on_music_slider_value_changed(value):
	AudioServer.set_bus_volume_db(1,linear_to_db(value)*offset) #can offset value if needed
	print(value)


func _on_sfx_slider_value_changed(value):
	AudioServer.set_bus_volume_db(2,linear_to_db(value)*offset) #can offset value if needed
	print(linear_to_db(value))


func _on_return_pressed():
	get_tree().change_scene_to_file("res://ui/main_menu.tscn")
