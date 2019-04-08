# Camera controller script

extends Camera2D

var magnitude = 0
var timeLeft = 0
var is_shaking = false

func _ready():
	pass

func shake(new_magnitude, lifeTime):
	if magnitude > new_magnitude: return
	
	magnitude = new_magnitude
	timeLeft = lifeTime
	
	if is_shaking: return
	is_shaking = true
	
	while timeLeft > 0:
		var pos = Vector2()
		pos.x = rand_range(-magnitude, magnitude)
		pos.y = rand_range(-magnitude, magnitude)
		set_position(pos)
		
		timeLeft -= get_process_delta_time()
		yield(get_tree(), "idle_frame")
		
	magnitude = 0
	is_shaking = false
	set_position(Vector2(0, 0))
	pass