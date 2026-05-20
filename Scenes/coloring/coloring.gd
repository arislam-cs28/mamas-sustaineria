extends Node2D

@onready var pellet_path = $"conveyor belt movement/PathFollow2D"
@onready var white = "res://Sprites/Plastics/white pellets.png"
@onready var orange = "res://Scenes/coloring/Untitled design-3-Photoroom.png"
@onready var red = "res://Sprites/Plastics/red pellets.png"
@onready var yellow = "res://Sprites/Plastics/yellow.png"

@export var speed: float = 0.5 

var path_finished: bool = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$buttons_Container.visible = false
	$white.visible = false
	$orange.visible = false
	$red.visible = false
	$yellow.visible = false
	pellet_path.progress_ratio = 0.0
	
	if GameManage.current_index == 0:
		await get_tree().create_timer(7.0).timeout
		$"processing instruct".visible = false
	else:
		$"processing instruct".visible = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if path_finished:
		return
	pellet_path.progress_ratio += speed * delta
	if pellet_path.progress_ratio >= 1:
		path_finished = true
		$buttons_Container.visible = true
		$white.visible = true
		$orange.visible = true
		$red.visible = true
		$yellow.visible = true
	
func _on_white_pressed() -> void:
	$"conveyor belt movement/PathFollow2D/Sprite2D".texture = load(white)
	submit_guess("White")
	

func _on_orange_pressed() -> void:
	$"conveyor belt movement/PathFollow2D/Sprite2D".texture = load(orange)
	submit_guess("Orange")

func _on_red_pressed() -> void:
	$"conveyor belt movement/PathFollow2D/Sprite2D".texture = load(red)
	submit_guess("Red")

func _on_yellow_pressed() -> void:
	$"conveyor belt movement/PathFollow2D/Sprite2D".texture = load(yellow)
	submit_guess("Yellow")

func submit_guess(player_choice: String):
	$buttons_Container.visible = false
	$white.visible = false
	$orange.visible = false
	$red.visible = false
	$yellow.visible = false
	
	if player_choice == GameManage.saved_color:
		GameManage.total_score += 1
		$result.visible = true
		$"result/result label".text = "Correct!"
		await get_tree().create_timer(3.0).timeout
		$result.visible = false
		$"finish order button".visible = true

	else:
		$result.visible = true
		$"result/result label".text = "Wrong. The customer wanted " + GameManage.saved_color
		await get_tree().create_timer(3.0).timeout
		$result.visible = false
		$"finish order button".visible = true

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
	
func _on_finish_order_button_pressed() -> void:
	GameManage.customer_is_waiting = false
	GameManage.current_index = (GameManage.current_index + 1) % 3
	GameManage.current_order_text = ""
	TransitionScreen.transition()
	await TransitionScreen.on_transition_finished
	get_tree().change_scene_to_file("res://Scenes/Ending/scoring.tscn")
