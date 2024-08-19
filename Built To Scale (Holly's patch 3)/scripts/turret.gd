extends Node2D

var projectile_scene : PackedScene = preload("res://scenes/projectile.tscn")

func _on_turret_shoot_timeout():
	var projectile = projectile_scene.instantiate()
	add_child(projectile)

