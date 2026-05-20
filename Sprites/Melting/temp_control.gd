extends Control

var final_angle = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func set_temp(value):
	$TextureProgressBar.radial_initial_angle += 30 * value
	final_angle = $TextureProgressBar.radial_initial_angle # i have no clue if this is gonna work and i hope it does
