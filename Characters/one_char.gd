extends CharacterBody2D


@export var speed: float = 200.0
@export var direction: Vector2 = Vector2.LEFT 


func _physics_process(delta: float) -> void:
	velocity = direction * speed
	if speed > 0.0:
		$AnimatedSprite2D.play("walk")
	move_and_slide()
