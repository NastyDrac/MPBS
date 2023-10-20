extends Button

@export var description = "Increase the power received from salvaging projectiles."

func  _ready():
	text = description

func upgrade():
	var bullets = DirAccess.get_files_at("res://bullets/bullet_template.tscn")
	get_tree().get_first_node_in_group("map").morePower += 2

func _on_toggled(button_pressed):
	get_tree().paused = false
	get_tree().get_first_node_in_group("levelscreen").queue_free()
	upgrade()
