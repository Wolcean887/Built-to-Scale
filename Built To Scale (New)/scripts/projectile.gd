extends Area2D

@export var PROJECTILE_SPEED = 200 #Projectile speed.
signal projectile_player_contact

func _process(delta):
	position += transform.x * PROJECTILE_SPEED * delta

func _on_body_entered(_body): #When the projectile hits the player or a platform, it gets deleted.
	destroy()

func destroy():
	queue_free()
