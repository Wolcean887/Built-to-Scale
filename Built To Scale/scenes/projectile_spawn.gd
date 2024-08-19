extends Node2D

func _on_projectile_spawn_timer_timeout():
	var Projectile = preload("res://scenes/projectile.tscn").instantiate()
	add_child(Projectile)

