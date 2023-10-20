extends Node2D

var upgrade = preload("res://upgrades/radiusUp.tscn")
var power = preload("res://upgrades/more_power.tscn")
var buttonNum = 3
@onready var shop = $CanvasLayer/HBoxContainer

func _ready():
	get_tree().paused = true
	var newUpgrade = upgrade.instantiate()
	shop.add_child(newUpgrade)
	
	var newPower = power.instantiate()
	shop.add_child(newPower)
	
	






