extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var label = $OrderPanel/OrderText
	label.text = "Customer Wants:\n" + GameManage.current_order_text
	label.visible_characters = 0
	var tween = create_tween()
	var total_letters = label.text.length()
	var duration = total_letters * 0.1
	tween.tween_property(label, "visible_characters", total_letters, duration)\
		.set_trans(Tween.TRANS_LINEAR)\
		.set_ease(Tween.EASE_IN_OUT)
	await tween.finished
	await get_tree().create_timer(1.0).timeout
	get_tree().change_scene_to_file("res://Scenes/Ordering/ordering.tscn")

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
