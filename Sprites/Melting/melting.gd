extends Node2D

var cont_func = true
var final_angle = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label.visible = false
	$Path2D2.visible = false
	print($/root/GameManage.what_player)
	if ($/root/GameManage.what_player == 0):
		$sort_instruct.visible = true
		await get_tree().create_timer(7.0).timeout
		$sort_instruct.visible = false
	else:
		$sort_instruct.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if cont_func:
		$TempControl.set_temp(delta*10)


func _on_button_pressed() -> void:
	$Stopwatch2/Timer.paused = true
	cont_func = false
	print($TempControl.final_angle)
	final_angle = $TempControl.final_angle
	
	if ((final_angle >= 310) and (final_angle <=350)) or ((final_angle >= 0) and (final_angle <= 21)):
		$"/root/GameManage".total_score += 1
		$Label.text = "Interesting temperature choice!"
		$Label.visible = true
	else:
		$Label.text = "Huh, is it the right temperature?"
		$Label.visible = true
		
	print($"/root/GameManage".total_score)
	await get_tree().create_timer(0.5).timeout
	$Path2D2.visible = true
	


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
	
