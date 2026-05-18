extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(_delta: float) -> void:

	$AnimatedSprite2D.play()
	await get_tree().create_timer(3.0).timeout
	$AnimatedSprite2D.stop()
