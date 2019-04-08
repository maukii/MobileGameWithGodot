# star script

extends Sprite

export var velocity = Vector2(0, 50)

func _ready():
	set_process(true)
	pass

func _process(delta):
	translate(velocity * delta)
	
	if position.y >= get_viewport_rect().size.y:
		position = Vector2(0, -180)
		pass
	pass