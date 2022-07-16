extends Node2D

enum Direction { UP, DOWN, LEFT, RIGHT }

var x
var y

# Called when the node enters the scene tree for the first time.
func _ready():
	x = 0
	y = 0


func move(direction):
	if direction == Direction.UP:
		y -= 1
		self.position.y -= 64
	elif direction == Direction.DOWN:
		y += 1
		self.position.y += 64
	elif direction == Direction.LEFT:
		x -= 1
		self.position.x -= 64
	elif direction == Direction.RIGHT:
		x += 1
		self.position.x += 64

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
