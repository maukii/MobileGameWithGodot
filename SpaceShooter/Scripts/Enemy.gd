# enemy script

extends Area2D

export var armor = 2 setget set_armor
export var velocity = Vector2(0, 0)
var offset

const scn_explosion = preload("res://Assets/Prefabs/Explosion.tscn")

func _ready():
	set_process(true)
	add_to_group("enemy")
	connect("area_entered", self, "_on_area_enter")
	offset = $Sprite.texture.get_size().y
	pass
	
func _process(delta):
	translate(velocity * delta)
	
	if (get_position().y - offset) >= get_viewport_rect().size.y:
		queue_free()
	pass

func set_armor(new_value):
	if is_queued_for_deletion(): return
	armor = new_value
	if armor <= 0: 
		create_explosion()
		queue_free()
	pass
	
func _on_area_enter(other):
	if other.is_in_group("ship"):
		other.armor -= 1
		create_explosion()
		queue_free()
	pass
	
func create_explosion():
	var explosion = scn_explosion.instance()
	explosion.set_position(get_position())
	get_tree().get_root().add_child(explosion)
	pass