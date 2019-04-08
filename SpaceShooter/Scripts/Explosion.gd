# Explosion script

extends Sprite

func _ready():
	randomize()
	set_rotation(deg2rad(rand_range(0, 360)))
	
	get_node("Smoke_p").set_emitting(true)
	get_node("Flare_p").set_emitting(true)
	
	get_node("/root/World/Camera").shake(5, 0.13)
	
	get_node("Anim").play("fade_out")
	yield(get_node("Anim"), "animation_finished")
	queue_free()
	pass
