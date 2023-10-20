extends Node2D


@onready var newGame = preload("res://map.tscn")

func _on_button_toggled(button_pressed):
	get_tree().change_scene_to_packed(newGame)
