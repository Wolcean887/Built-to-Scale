extends CharacterBody2D

@export var SPEED = 600.0 #Player speed.
@export var JUMP_VELOCITY = -1200.0 #Player jump power.
@export var DASH_VELOCITY = 2000 #Player dash power.

var can_dash = true #Variable which checks if the player is able to dash.
var default_respawn = true #Variable which checks if the player has gone through a checkpoint or not.
var respawn_point : Vector2 #Variable with some coordinates for the player to respawn at.

@export var GRAVITY = 2400

func _physics_process(delta):
	if not is_on_floor():
		velocity.y += GRAVITY * delta #Makes the player fall when not on the ground based on gravity.

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	#Handle dash.
	if Input.is_action_pressed("dash"):
		if can_dash:
			velocity.x = direction * DASH_VELOCITY
			$Dash_Ability/Dash_Timer.start()
			$Dash_Ability/Can_Dash_Timer.start()
			
	move_and_slide()

func _on_dash_timer_timeout(): #Timer which allows the player to dash only for a short amount of time.
	can_dash = false #Once the timer has reached 0, the player cannot dash anymore.
	
func _on_can_dash_timer_timeout(): #Timer which allows the player to dash again after a short amoutn of time has passed.
	can_dash = true #Once the timer has reached 0, the player can dash again.
	
func _on_checkpoint_new_checkpoint(): #Function that runs when the player touches a checkpoint that hasn't been activated before.
	default_respawn = false 
	respawn_point = position #The player's respawn location is changed from the default one to the checkpoint's location.

func _on_projectile_body_entered(_body): #Function that runs when the player touches a projectile.
	_death()
	
func _on_spike_detection_body_entered(_body): #Function that runs when the player touches a spike.
	_death()
	
func _death(): #Function that runs when the player dies.
	velocity.y = 0
	if default_respawn: #If the player hasn't activated any checkpoints, they respawn to the default respawn location.
		position.x = -1725
		position.y = 336
	else: #If the player has activated a checkpoint, they respawn to the checkpoint's location.
		position = respawn_point
