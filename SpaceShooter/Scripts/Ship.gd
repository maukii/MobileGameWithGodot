# ship script

extends Area2D

export var timeBetweenShots = 0.2
var armor = 4 setget set_armor
const scn_lazer = preload("res://Assets/Prefabs/Lazer_ship.tscn")
const scn_explosion = preload("res://Assets/Prefabs/Explosion.tscn")
const scn_flash = preload("res://Assets/Prefabs/Flash.tscn")

signal armor_changed(armor)

func _ready():
	set_process(true)
	add_to_group("ship")
	$Timer.wait_time = timeBetweenShots
	$Timer.connect("timeout", self, "shoot")
	$Timer.start()
	pass
	
func _process(delta):
	# get mouse / input position 
	var pos = position
	pos.x = lerp(pos.x, get_global_mouse_position().x, 0.2)
	
	var view_size = get_viewport_rect().size
	pos.x = clamp(pos.x, 0 + 16, view_size.x - 16)
	position = pos
	
	pass

func shoot():
	var position_left = get_node("Cannons/LeftCannon").get_global_position()
	var position_right = get_node("Cannons/RightCannon").get_global_position()
	create_lazer(position_left)
	create_lazer(position_right)
	$Timer.wait_time = timeBetweenShots
	$Timer.start()

func create_lazer(pos):
	var lazer = scn_lazer.instance()
	lazer.set_position(pos)
	get_tree().get_root().add_child(lazer)
	#call_deferred("add_child", lazer)
	pass
	
func set_armor(new_value):
	if new_value < armor:
		get_node("/root/World").add_child(scn_flash.instance())
		
	armor = new_value
	emit_signal("armor_changed", armor)
	
	if armor <= 0:
		create_explosion()
		get_node("/root/World/Camera").shake(8, 3)
		queue_free()
	pass
	
func create_explosion():
	var explosion = scn_explosion.instance()
	explosion.set_position(get_position())
	get_tree().get_root().add_child(explosion)
	pass