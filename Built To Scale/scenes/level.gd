extends Node


@onready var pause_menu = $CanvasLayer/PauseMenu
var paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	Engine.time_scale = 1
	MusicController.play_platform_music()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		start_pause_menu()
		
func start_pause_menu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	
	paused = !paused
