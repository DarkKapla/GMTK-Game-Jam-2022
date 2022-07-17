extends "res://Entity.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

const WEAPON = "[color=#fe4444][center]123[/center][/color]"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Handles the player's input
func _unhandled_key_input(event):
	var direction = get_move_direction(event)
	if direction == null:
		return

	if self.try_move(direction):
		$LeftText.bbcode_text = WEAPON
	else:
		$LeftText.bbcode_text = ""


# Return the direction of the event. Return null if the event is not asking for a move.
func get_move_direction(event):
	if event.is_action_pressed("ui_up"):
		return Direction.UP
	elif event.is_action_pressed("ui_down"):
		return Direction.DOWN
	elif event.is_action_pressed("ui_left"):
		return Direction.LEFT
	elif event.is_action_pressed("ui_right"):
		return Direction.RIGHT
	else:
		return null
