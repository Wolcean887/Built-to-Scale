extends Area2D

var checkpoint_activated = false #Variable that checks if the checkpoint has been activated before.
signal new_checkpoint #Signal for the player to change the respawn location when touching the checkpoint for the first time.
@onready var bootup_noise = $Checkpoint_Bootup

func _on_body_entered(_body):
	if not checkpoint_activated: #If the player touches the checkpoint for the first time, the checkpoint gets activated and emits the signal for the player to change the respawn location.
		bootup_noise.play()
		checkpoint_activated = true
		emit_signal("new_checkpoint")
	else: #If the player has already activated the checkpoint, nothing happens.
		pass
		
