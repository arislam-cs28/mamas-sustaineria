extends Node2D

var colors = ["Red", "Blue", "Green", "Yellow", "Pink", "Purple", "Orange", "White", "Black"] 

func _ready() -> void:
	# reset waiting when starting new order
	if GameManage.current_order_text == "":
		GameManage.customer_is_waiting = false

	var customer_scene = GameManage.get_next_customer()
	
	if customer_scene:
		var instance = customer_scene.instantiate()
		add_child(instance)
		instance.add_to_group("current_customer")
		
		if GameManage.customer_is_waiting:
			# standing after order
			instance.global_position = Vector2(600, 220) 
			instance.moves = false
			$Sorting.visible = true
			$PanelContainer.visible = true
			$Processing.visible = true
			$Melting.visible = true
			$Coloring.visible = true
			
		else:
			#place on right side of screen
			instance.global_position = Vector2(1200, 350) 
			
			# reboot variables
			instance.moves = true
			if "speed" in instance:
				instance.speed = 200.0 
				
			$Sorting.visible = false
			$PanelContainer.visible = false
			$Processing.visible = false
			$Melting.visible = false
			$Coloring.visible = false
	else:
		print("No more customers!")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("current_customer"):
		if GameManage.customer_is_waiting:
			return
			
		body.moves = false
		GameManage.customer_is_waiting = true
		
		var random_color = colors[randi() % colors.size()]
		var final_order = random_color + " plastic"
		GameManage.current_order_text = final_order
		
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Scenes/Ordering/orderingScreen.tscn")


func _on_sorting_pressed() -> void:
	get_tree().change_scene_to_file("res://Sprites/Sorting/sorting.tscn")

func _on_processing_pressed() -> void:
	get_tree().change_scene_to_file("res://Sprites/Processing/processing.tscn")

func _on_melting_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/melting/melting.tscn")

func _on_coloring_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/coloring/coloring.tscn")
