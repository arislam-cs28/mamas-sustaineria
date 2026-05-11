extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# $VBoxContainer/StartButton.grab_focus()
	pass


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Intro/intro_video.tscn")


func _on_credits_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main/Credits.tscn")


func _on_manual_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Main/Instructions.tscn")
