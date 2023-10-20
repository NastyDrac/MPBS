extends Button



@export var description = "Increase your magnet's radius by 50%"

func upgrade():
	var player = get_tree().get_first_node_in_group("player")
	player.magnet.scale *= 1.5
	get_tree().get_first_node_in_group("map").newArm()
	
func _ready():
	text = description


func _on_toggled(button_pressed):
	get_tree().paused = false
	get_tree().get_first_node_in_group("levelscreen").queue_free()
	upgrade()
