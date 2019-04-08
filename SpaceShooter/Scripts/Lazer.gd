# Lazer script

extends Area2D

export var velocity = Vector2()
const scn_flare = preload("res://Assets/Prefabs/Flare.tscn")

func _ready():
	set_process(true)
	create_flare()
	
	yield(get_node("Visible"), "screen_exited")
	queue_free()
	pass

func _process(delta):
	translate(velocity * delta)
	pass
	
func create_flare():
	var flare = scn_flare.instance()
	flare.set_position(get_position())
	get_tree().get_root().add_child(flare)
	pass