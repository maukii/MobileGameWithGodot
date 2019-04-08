# Enemy spawner

extends Node2D

const enemies = [
 	preload("res://Assets/Prefabs/Enemykamikaze.tscn"),
	preload("res://Assets/Prefabs/EnemyClever.tscn")
]

func _ready():
	
	#Set timer
	$Timer.wait_time = rand_range(1, 3)
	$Timer.connect("timeout", self, "spawn")
	$Timer.start()
	pass

func spawn():
	randomize()
	var enemy = choose_random(enemies).instance()
	var pos = Vector2(0, 0)
	pos.x = rand_range(16, get_viewport().get_visible_rect().size.x - 16)
	pos.y = -16
	enemy.set_position(pos)
	get_node("Enemies").add_child(enemy)
	
	#Reset timer
	$Timer.wait_time = rand_range(1, 3)
	$Timer.start()
	pass
	
func choose_random(choises):
	randomize()
	var rand_index = randi() % choises.size()
	return choises[rand_index]
	pass