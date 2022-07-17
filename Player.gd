extends "res://Entity.gd"

enum Weapon {None, Rock = 1, Paper = 2, Scissors = 3}

func weapon_text(weapon):
	if weapon == Weapon.Rock:
		return "[color=#fe4444][center]R[/center][/color]"
	elif weapon == Weapon.Paper:
		return "[color=#fe4444][center]P[/center][/color]"
	elif weapon == Weapon.Scissors:
		return "[color=#fe4444][center]S[/center][/color]"
	else:
		assert(false)

"""
	  yp
	  ┌────┐
   ┌────┐zm│   
xm │ zp │──┘  xp
   └────┘
	  ym
"""
var xp = Weapon.None
var xm = Weapon.None
var ym = Weapon.None
var yp = Weapon.None
var zm = Weapon.None
var zp = Weapon.None

func roll(direction):
	if direction == Direction.UP:
		var t = zp
		zp = ym
		ym = zm
		zm = yp
		yp = t
	elif direction == Direction.DOWN:
		var t = zp
		zp = yp
		yp = zm
		zm = ym
		ym = t
	elif direction == Direction.LEFT:
		var t = zp
		zp = xp
		xp = zm
		zm = xm
		xm = t
	elif direction == Direction.RIGHT:
		var t = zp
		zp = xm
		xm = zm
		zm = xp
		xp = t
	else:
		assert(false)

	self.update_texts()

func update_texts():
	$LeftText.bbcode_text = weapon_text(xm)
	$RightText.bbcode_text = weapon_text(xp)

# Called when the node enters the scene tree for the first time.
func _ready():
	xm = Weapon.Rock
	xp = Weapon.Rock
	ym = Weapon.Paper
	yp = Weapon.Paper
	zm = Weapon.Scissors
	zp = Weapon.Scissors

# Handles the player's input
func _unhandled_key_input(event):
	var direction = get_move_direction(event)
	if direction == null:
		return

	self.try_move(direction)

func moved(direction):
	self.roll(direction)

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
