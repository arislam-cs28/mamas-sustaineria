extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if GameManage.current_index == 0:
		await get_tree().create_timer(7.0).timeout
		$"processing instruct".visible = false
	else:
		$"processing instruct".visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_sorting_pressed() -> void:
	get_tree().change_scene_to_file("res://Sprites/Sorting/sorting.tscn")
	
func _on_processing_pressed() -> void:
	get_tree().change_scene_to_file("res://Sprites/Processing/washing.tscn")
