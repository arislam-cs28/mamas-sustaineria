extends Node

var current_index = 0

# Add all your character files here!
var customers = [
	preload("res://Characters/one_char.tscn"),
	preload("res://Characters/two_char.tscn"),
	preload("res://Characters/three_char.tscn")
]

func get_next_customer():
	if current_index < customers.size():
		return customers[current_index]
	return null

func go_to_next_day():
	current_index += 1
	get_tree().change_scene_to_file("res://Scenes/ordering.tscn")



# to put in finish screen
#func _on_finish_button_pressed():
#    GameManage.current_index += 1
# get_tree().change_scene_to_file("res://Scenes/ordering.tscn")
