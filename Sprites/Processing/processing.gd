extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
func _on_sorting_pressed() -> void:
	get_tree().change_scene_to_file("res://Sprites/Sorting/sorting.tscn")

func _on_processing_pressed() -> void:
	get_tree().change_scene_to_file("res://Sprites/Processing/processing.tscn")

func _on_melting_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/melting/melting.tscn")

func _on_coloring_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/coloring/coloring.tscn")
