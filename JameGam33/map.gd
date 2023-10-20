extends Node2D

@onready var player = preload("res://plane.tscn")
@onready var scoreBoard = $CanvasLayer/Label
var levelScreen = preload("res://level_up_screen.tscn")
var shooter = preload("res://fire_point.tscn")
var score = 0
var nextLevel = 20

var battLife = 100
@onready var battMeter = $CanvasLayer/TextureProgressBar
@onready var timer = $CanvasLayer/Timer
var maxBatt = 100
var depletionRate = 10
var morePower = 2
var maxDropOff = 5
var dropOff = 0


func _ready():
	var newPlayer = player.instantiate()
	add_child(newPlayer)
	newPlayer.global_position = get_global_mouse_position()
	battMeter.max_value = maxBatt
	battLife = maxBatt
func _process(delta):
	scoreBoard.text = "Score:  " + var_to_str(score)
	battMeter.value = battLife
	if battLife >= maxBatt:
		battLife = maxBatt
	
	if Input.is_action_just_pressed("click"):
		timer.start(1)
	if Input.is_action_just_released("click"):
		timer.stop()
		
	if score >= nextLevel:
		print("new level")
		nextLevel = nextLevel * 2
		var newScreen = levelScreen.instantiate()
		add_child(newScreen)
	if dropOff >= maxDropOff and $dropOff.prepared == true:
		$dropOff.prepared = false
		coolDown()
	print(global_position)


func _on_timer_timeout():
	battLife -= depletionRate

func newArm():
	var newShooter = shooter.instantiate()
	add_child(newShooter)


func coolDown():
	$dropOff.timer.start()

