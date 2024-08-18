extends Area2D

@export var PROJECTILE_SPEED = 200

func _process(delta):
	position += transform.x * PROJECTILE_SPEED * delta
	
func _on_body_entered(_body):
	queue_free()
