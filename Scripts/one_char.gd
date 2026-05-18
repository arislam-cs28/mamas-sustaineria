extends CharacterBody2D

@export var speed: float = 200.0
@export var direction: Vector2 = Vector2.LEFT 
@export var moves: bool = true

func _physics_process(_delta: float) -> void:
	# standing still
	if not moves:
		velocity = Vector2.ZERO
		if $AnimatedSprite2D.sprite_frames.has_animation("idle"):
			$AnimatedSprite2D.play("idle")
		else:
			$AnimatedSprite2D.stop()
			$AnimatedSprite2D.frame = 0
		move_and_slide()
		return

	# walking
	velocity = direction * speed
	$AnimatedSprite2D.play("walk") 
	move_and_slide()
