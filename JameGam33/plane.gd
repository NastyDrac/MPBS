extends Sprite2D

@onready var deathScreen = preload("res://death_screen.tscn")
@onready var magnet = $Area2D/CollisionShape2D
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_global_mouse_position()
	




func _on_area_2d_body_entered(body):
	if body.is_in_group("bullet"):
		body.closeEnough = true
	else:
		print(body.get_name())


func _on_area_2d_body_exited(body):
	if body.is_in_group("bullet"):
		body.closeEnough = false
		body.caught = false


func _on_player_body_body_entered(body):
	if body.is_in_group("bullet") and body.caught == false:
		get_tree().change_scene_to_packed(deathScreen)
		
