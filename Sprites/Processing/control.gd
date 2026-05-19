extends Control

@onready var background = $"slider background"
@onready var ticker = $"slider background/TextureRect"

var speed: float = 150.0
var direction: int = 1
var current: float = 0.0

#green
var green_min: float = 45.0
var green_max: float = 55.0
var yellow_min: float = 27.0
var yellow_max: float = 75.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	current += speed * delta * direction
	if current >= 100:
		direction = -1 # reverse diretcion 
	elif current <= 0.0:
		direction = 1 # reverse diretcion 
	ticker.position.x = (current / 100) * background.size.x
	
func _on_start_washing_buttone_pressed() -> void:
	set_process(false)
	if current >= green_min and current <= green_max:
		GameManage.total_score += 1
		$"../background for text".visible = true
		$"../background for text/Label".text = "Good!"
	elif current >= yellow_min and current <= yellow_max:
		GameManage.total_score += 0.5
		$"../background for text".visible = true
		$"../background for text/Label".text = "Okay!"
	else:
		$"../background for text".visible = true
		$"../background for text/Label".text = "Yikes!"
	$"../dirty path".set_process(true)
	$"../dirty path/Timer".start()
	await get_tree().create_timer(1.0).timeout
	$"../Path2D2".set_process(true)
	$"../Path2D2/Timer".start()
	await get_tree().create_timer(5.0).timeout
	get_tree().change_scene_to_file("res://Sprites/Processing/shredding.tscn")
