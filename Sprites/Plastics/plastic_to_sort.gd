extends Sprite2D

@export var plastics_available: Array[Texture2D]
var plastic_name = ""

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = plastics_available.pick_random()
	plastic_name = str(texture)
	print(plastic_name) 
