extends Path2D

@export var piece_scene = preload("res://Sprites/Processing/dirtyplastic.tscn")

@export var speed: float = 400.0 

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_process(false)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for child in get_children():
		if child is PathFollow2D:
			child.progress += speed * delta
			#delete
			if child.progress_ratio >= 1.0:
				child.queue_free()
				
func spawn_piece():
	var new_pieceOnPath = PathFollow2D.new()
	new_pieceOnPath.loop = false
	var new_piece = piece_scene.instantiate()
	new_pieceOnPath.add_child(new_piece)
	#put on path
	add_child(new_pieceOnPath)


func _on_timer_timeout() -> void:
	spawn_piece()
