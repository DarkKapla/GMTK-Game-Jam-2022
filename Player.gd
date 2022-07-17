extends "res://Entity.gd"

enum Weapon {None, Rock = 1, Paper = 2, Scissors = 3}

const WEAPON_ROCK = "[color=#fe4444][center]1[/center][/color]"


"""
	  zp
	  ┌────┐
   ┌────┐yp│   
xm │ ym │──┘  xp
   └────┘
	  zm
"""
var xp = Weapon.None
var xm = Weapon.None
var yp = Weapon.None
var ym = Weapon.None
var zp = Weapon.None
var zm = Weapon.None

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Handles the player's input
func _unhandled_key_input(event):
	var direction = get_move_direction(event)
	if direction == null:
		return

	if self.try_move(direction):
		$LeftText.bbcode_text = WEAPON_ROCK
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
