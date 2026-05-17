extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$OrderPanel/OrderText.text = "Customer Wants:\n" + GameManage.current_order_text

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
