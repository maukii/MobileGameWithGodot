# Ships lazer script

extends "res://Scripts/Lazer.gd"

func _ready():
	connect("area_entered", self, "_on_area_enter")
	pass

func _on_area_enter(other):
	if other.is_in_group("enemy"):
		other.armor -= 1
		create_flare()
		get_node("/root/World/Camera").shake(1, 0.13)
		queue_free()
	pass