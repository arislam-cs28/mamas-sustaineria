extends Node2D

var count = 0
var show_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print($/root/GameManage.what_player)
	if ($/root/GameManage.what_player == 0):
		$sort_instruct.visible = true
		$Stopwatch2/Timer.paused = true
		await get_tree().create_timer(7.0).timeout
		$sort_instruct.visible = false
	else:
		$sort_instruct.visible = false
	$Stopwatch2/Timer.paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print($"/root/GameManage".total_score)
	# if show_end: urgh i guess i cant do it...
		# $Panel/RichTextLabelLabel.text = "Sorting complete! Time to process next!"
	# else:
		# $Panel/RichTextLabelLabel.text = "Fun fact: Did you know that machine learning can make sorting more efficient?"


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
