extends CharacterBody2D

func _physics_process(delta: float) -> void:

	$AnimatedSprite2D.play()
	await get_tree().create_timer(3.0).timeout
	$AnimatedSprite2D.stop()
