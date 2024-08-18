extends CharacterBody2D

@export var SPEED = 600.0 #I liked 400
@export var JUMP_VELOCITY = -1200.0 #I liked -800
@export var DASH_VELOCITY = 2000

var can_dash = true
var default_respawn = true
var respawn_point : Vector2

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@export var gravity = 2400 #I liked 2400 (needs to be bigger to account for * delta below)

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		#multiplying by delta means speed won't slow if framerate slows
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	if Input.is_action_pressed("dash"):
		if can_dash:
			velocity.x = direction * DASH_VELOCITY
			$Dash_Ability/Dash_Timer.start()
			$Dash_Ability/Can_Dash_Timer.start()
			
	move_and_slide()

func _on_dash_timer_timeout():
	can_dash = false
	
func _on_can_dash_timer_timeout():
	can_dash = true
	
func _on_checkpoint_new_checkpoint():
	default_respawn = false
	respawn_point = position
	
func _on_projectile_body_entered(_body):
	if default_respawn:
		position.x = -1725
		position.y = 320
	else:
		position = respawn_point
