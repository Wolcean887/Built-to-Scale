extends Area2D

var checkpoint_activated = false
signal new_checkpoint

func _on_body_entered(_body):
	if not checkpoint_activated:
		print("Checkpoint activated!")
		checkpoint_activated = true
		emit_signal("new_checkpoint")
	else:
		pass
		
