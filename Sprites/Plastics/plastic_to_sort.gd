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
	$Label.visible = false

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


func _on_area_2d_body_entered(body: Node2D) -> void:
	print(body.name)
	
	if (plastic_name == "teal" or plastic_name == "red"):
		if (body.name == "Colored"):
			$/root/Sorting.count += 1
			$Label.visible = true
			$Label.text = "Great job!"
			await get_tree().create_timer(1.0).timeout
			hide()
			$Label.visible = false
		else:
			$Label.text = "Oops, put it back in..."
	elif (plastic_name == "dirty_teal" or plastic_name == "dirty_red" or plastic_name == "dirty_white"):
		if (body.name == "Contaminated"):
			$/root/Sorting.count += 1
			$Label.visible = true
			$Label.text = "Awesome!"
			await get_tree().create_timer(1.0).timeout
			hide()
			$Label.visible = false
		else:
			$Label.text = "Wait! Put it back!"
	elif (plastic_name == "white"):
		if (body.name == "White"):
			$/root/Sorting.count += 1
			$Label.visible = true
			$Label.text = "Yay! So nice!"
			await get_tree().create_timer(1.0).timeout
			hide()
			$Label.visible = false
		else:
			$Label.text = "Wait! Put it back!"
		
