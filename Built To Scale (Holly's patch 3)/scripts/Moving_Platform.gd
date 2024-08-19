extends Path2D

@export var LOOP = true
@export var SPEED_SCALE = 1.0
@export var MOVEMENT_SPEED = 1.0

@onready var path = $Moving_Platform_PathFollow
@onready var animation = $Moving_Platform_AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	if not LOOP:
		animation.play("moving_horizontal")
		animation.speed_scale = SPEED_SCALE
		set_process(false)
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	path.progress += MOVEMENT_SPEED
