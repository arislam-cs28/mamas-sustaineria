extends Sprite2D

@export var plastics_available: Array[Texture2D]
var plastic_name = ""
var file_path
var drags = false
var delay = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture = plastics_available.pick_random()
	file_path = texture.resource_path.get_file().get_basename()
	plastic_name = file_path
	print(plastic_name) 

func _physics_process(delta: float) -> void:
	if drags:
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", get_global_mouse_position(), delay * delta)
	
func _input(event):
	if event is InputEventMouseButton:
		if event.pressed:
			if get_rect().has_point(to_local(event.position)):
				get_viewport().set_input_as_handled()
				print("clicked pls work")
				drags = true
			else:
				drags = false
				print("it no work augh")
		elif !event.pressed:
			drags = false
