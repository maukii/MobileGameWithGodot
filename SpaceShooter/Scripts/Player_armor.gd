# Player health script

extends Sprite

func _ready():
	pass

func _on_ship_armor_change(armor):
	set_frame(armor)
	pass

func _on_Ship_armor_changed(armor):
	set_frame(armor)
	pass # Replace with function body.
