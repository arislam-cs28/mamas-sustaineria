extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_button_pressed() -> void:
	get_tree().change_scene("res://Scenes/Intro/intro_video.tscn")


func _on_credits_pressed() -> void:
	get_tree().change_scene("res://Scenes/Main/Credits.tscn")


func _on_manual_pressed() -> void:
	pass # Replace with function body.
