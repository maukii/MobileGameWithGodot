# Flash script

extends Sprite

func _ready():
	get_node("Anim").play("fade_out")
	yield(get_node("Anim"), "animation_finished")
	queue_free()
	pass
