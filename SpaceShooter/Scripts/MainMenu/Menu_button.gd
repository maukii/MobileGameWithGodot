# Back to menu script

extends TextureButton

func _ready():
	connect("pressed", self, "_on_pressed")
	pass

func _on_pressed():
	get_tree().change_scene("res://Scenes/Main.tscn")
	pass
	
func _on_Ship_tree_exited():
	show()
	pass
