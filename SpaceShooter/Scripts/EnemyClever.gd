# Clever enemy script

extends "res://Scripts/Enemy.gd"
const scn_lazer = preload("res://Assets/Prefabs/Lazer_enemy.tscn")

func _ready():
	$Timer.wait_time = rand_range(1, 3)
	$Timer.connect("timeout", self, "shoot")
	$Timer.start()
	pass

func _process(delta):
	if get_position().x <= 16:
		velocity.x = abs(velocity.x)
	if get_position().x >= get_viewport_rect().size.x - 16:
		velocity.x = -abs(velocity.x)
	pass
	
func shoot():
	var lazer = scn_lazer.instance()
	lazer.set_position(get_node("Cannon").get_global_position())
	get_tree().get_root().add_child(lazer)
	$Timer.wait_time = rand_range(1, 3)
	$Timer.start()
	pass