extends RigidBody2D

@onready var label = $Label3
@onready var timer = $Timer

func _ready():
	await get_tree().create_timer(1.0).timeout
	timer.start()
	
func time_left_still():
	var time_left = timer.time_left
	var minute = floor(time_left / 60)
	var second = int(time_left) % 60
	
	return [minute, second]
	
func _process(delta):
	label.text = "%02d:%02d" % time_left_still()


# func _on_timer_timeout() -> void:
	# if ($/root/Sorting.count == 12):
	# 	$/root/GameManage.total_score += 1
	# $/root/Sorting.show_end = true
	
