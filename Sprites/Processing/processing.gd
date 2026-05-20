extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_sorting_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Sprites/Sorting/sorting.tscn")
	
func _on_processing_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Sprites/Processing/washing.tscn")

func _on_melting_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Sprites/Melting/melting.tscn")

func _on_coloring_pressed() -> void:
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/coloring/coloring.tscn")

func _on_shred_button_pressed() -> void:
	$Path2D.shredding()
	await get_tree().create_timer(2.0).timeout
	if $shredpath/Timer.is_stopped():
		$shredpath/Timer.start()   
	$shredpath.shredding()
	await get_tree().create_timer(6.0).timeout
	$PanelContainer2.visible = true
	$PanelContainer2/Label.text = "Shredded!"
	
