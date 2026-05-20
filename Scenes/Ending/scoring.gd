extends Node2D

var score = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	score = $"/root/GameManage".total_score
	if (score == 0):
		$RichTextLabel.text = "Aww, better luck next time! Recycling for the first time is hard. Before getting a job in recycling, try learning about various equipment, like filtration systems, or AI-driven plastic sorting methods!"
		$star1.visible = false
		$star3.visible = false
	elif (score > 0 and score < 3):
		$RichTextLabel.text = "You are a really good recycler! You could try art competitions using recycled materials for some competitive, efficient, and creative fun."
		$star3.visible = false
	else:
		$RichTextLabel.text = "You are a stellar recycler! Now that you understand plastics, you should try your hand at recycling competitions with your friends, like seeing who can make the best filtration systems or more!"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
