extends CharacterBody2D


@export var speed: float = 200.0
@export var direction: Vector2 = Vector2.LEFT 


func _physics_process(delta: float) -> void:
	velocity = direction * speed
	if speed > 0.0:
		$AnimatedSprite2D.play("walk")
	move_and_slide()
	

func _on_area_2d_area_entered(area: Area2D) -> void:
	speed = 0.0
	$AnimatedSprite2D.stop()
	print("or does it?")
