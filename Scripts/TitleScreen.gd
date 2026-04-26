# this scene exhibits the main user interface of the title scene
# the title scene is called "title.tscn"
extends Node



func _on_start_button_pressed() -> void:
	get_tree().change_scene("res://Scenes/MainScene.tscn")
	pass # Replace with function body.
