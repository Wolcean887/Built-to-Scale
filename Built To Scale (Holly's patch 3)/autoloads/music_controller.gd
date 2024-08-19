extends Node

var menu_music = preload("res://audio/GMTK Jam24 Menu Theme (short loop test).mp3")
var platform_music = preload("res://audio/GMTK Jam24 Platform Theme 1.mp3")

func play_menu_music():
	if !$AudioStreamPlayer.is_playing() or !$AudioStreamPlayer.stream.resource_path.get_file() == "GMTK Jam24 Menu Theme (short loop test).mp3":
		$AudioStreamPlayer.stream = menu_music
		$AudioStreamPlayer.play()

func play_platform_music():
	if !$AudioStreamPlayer.is_playing() or !$AudioStreamPlayer.stream.resource_path == "GMTK Jam24 Platform Theme 1.mp3":
		$AudioStreamPlayer.stream = platform_music
		$AudioStreamPlayer.play()
