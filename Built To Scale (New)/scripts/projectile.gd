extends Area2D

@export var PROJECTILE_SPEED = 200 #Projectile speed.

func _process(delta):
	position += transform.x * PROJECTILE_SPEED * delta
	
func _on_body_entered(_body): #When the projectile hits the player, it gets deleted.
	queue_free()
