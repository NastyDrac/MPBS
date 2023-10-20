extends Node2D


var length = 2000
var speed = 5
@onready var spawnPoint = $Node2D
@onready var bullet = preload("res://bullets/bullet_template.tscn")

func _ready():
	rotation_degrees = randi_range(0,350)

func _process(delta):
	if rotation_degrees >= 360:
		rotation_degrees = 0

func _on_timer_timeout():
	rotation_degrees += speed
	fire()


func fire():
	var newBullet = bullet.instantiate()
	newBullet.global_position = spawnPoint.global_position
	get_parent().add_child(newBullet)
	
