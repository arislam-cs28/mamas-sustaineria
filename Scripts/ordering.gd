extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass



func _on_area_2d_body_entered(body: CharacterBody2D) -> void:
	if body.name == "Char1":
		$Char1.moves = false
		await get_tree().create_timer(1.0).timeout
		get_tree().change_scene_to_file("res://Scenes/Ordering/orderingScreen.tscn")


func _on_timer_timeout() -> void:
	pass # Replace with function body.
