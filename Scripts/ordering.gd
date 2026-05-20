extends Node2D

var colors = ["White", "Yellow", "Red", "Orange"] 

func _ready() -> void:
	# reset waiting flag if starting brand new order loop
	if GameManage.current_order_text == "":
		GameManage.customer_is_waiting = false

	var customer_scene = GameManage.get_next_customer()
	
	if customer_scene:
		var instance = customer_scene.instantiate()
		add_child(instance)
		instance.add_to_group("current_customer")
		
		if GameManage.customer_is_waiting:
			# standing after order
			instance.global_position = Vector2(600, 210) 
			instance.moves = false
			$PanelContainer.visible = true
			$Sorting.visible = true
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
	else:
		print("No more customers!")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("current_customer"):
		if GameManage.customer_is_waiting:
			return
			
		body.moves = false
		GameManage.customer_is_waiting = true
		
		var random_color = colors[randi() % colors.size()]	
		GameManage.saved_color = random_color
		var final_order = random_color + " Plastic"
		GameManage.current_order_text = final_order
		
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Scenes/Ordering/orderingScreen.tscn")



func _on_sorting_pressed() -> void:
	get_tree().change_scene_to_file("res://Sprites/Sorting/sorting.tscn")

func _on_processing_pressed() -> void:
	get_tree().change_scene_to_file("res://Sprites/Processing/washing.tscn")
	
func _on_melting_pressed() -> void:
	get_tree().change_scene_to_file("res://Sprites/Melting/melting.tscn")

func _on_coloring_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/coloring/coloring.tscn")
	
# buttons to respective scenes
