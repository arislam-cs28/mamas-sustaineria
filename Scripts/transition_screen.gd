extends CanvasLayer

signal on_transition_finished

@onready var color_rect = $ColorRect # creating colorRect variable
@onready var animation_player = $AnimationPlayer # creating animationPlayer variable

# Called when the node enters the scene tree for the first time.
func _ready() -> void: # setting up initial signals and boolean values
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	
func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		on_transition_finished.emit()
		animation_player.play("fade_to_normal")
	elif anim_name == "fade_to_normal":
		color_rect.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func transition():
	color_rect.visible = true
	animation_player.play("fade_to_black")
