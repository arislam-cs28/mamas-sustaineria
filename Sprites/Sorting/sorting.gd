extends Node2D

var count = 0
var show_end = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print($/root/GameManage.what_player)
	$Panel.visible = false
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
	if show_end:
		$Panel.visible = true
