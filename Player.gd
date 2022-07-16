extends "res://Entity.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Handles the player's input
func _unhandled_key_input(event):
	if event.is_action_pressed("ui_up"):
		self.move(Direction.UP)
	elif event.is_action_pressed("ui_down"):
		self.move(Direction.DOWN)
	elif event.is_action_pressed("ui_left"):
		self.move(Direction.LEFT)
	elif event.is_action_pressed("ui_right"):
		self.move(Direction.RIGHT)
