extends CharacterBody2D


@export var speed: float = 200.0
@export var direction: Vector2 = Vector2.LEFT 
@export var moves = true

func _physics_process(_delta: float) -> void:
	if !moves:
		speed = 0.0
	velocity = direction * speed
	if speed > 0.0:
		$AnimatedSprite2D.play("walk")
	else:
		$AnimatedSprite2D.stop()
	move_and_slide()
