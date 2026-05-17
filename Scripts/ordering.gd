extends Node2D

var colors = ["Red", "Blue", "Green", "Yellow", "Pink", "Purple", "Orange", "White", "Black"] 

func _ready() -> void:
	var customer_scene = GameManage.get_next_customer()
	
	if customer_scene:
		var instance = customer_scene.instantiate()
		add_child(instance)
		# Set where they walk in from (Right side)
		instance.global_position = Vector2(1000, 350) 
		instance.add_to_group("current_customer")
	else:
		print("No more customers!")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("current_customer"):
		var random_color = colors[randi() % colors.size()]
		var final_order = random_color + " plastic"
		GameManage.current_order_text = final_order
		if "moves" in body:
			body.moves = false
		# Wait and switch scenes
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Scenes/Ordering/orderingScreen.tscn")
