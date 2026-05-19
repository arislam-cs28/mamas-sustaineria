extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Stopwatch2/Timer.paused = true
	await get_tree().create_timer(7.0).timeout
	$sort_instruct.visible = false
	$Stopwatch2/Timer.paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
