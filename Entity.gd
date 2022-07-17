extends Node2D

enum Direction { UP, DOWN, LEFT, RIGHT }

var coordinates
var world

# Called when the node enters the scene tree for the first time.
func _ready():
	world = get_parent()
	coordinates = world.world_to_map(self.position)

# Will be called after moving. Useful for nodes inheriting from Entity.
func moved(direction):
	pass

# Request for a move of one step in the direction. Return whether the move was done.
func try_move(direction):
	var vector = Vector2.ZERO

	if direction == Direction.UP:
		vector.y -= 1
	elif direction == Direction.DOWN:
		vector.y += 1
	elif direction == Direction.LEFT:
		vector.x -= 1
	elif direction == Direction.RIGHT:
		vector.x += 1
	else:
		return false
	
	if world.is_empty_cell(coordinates + vector):
		self.coordinates += vector
		self.position += world.cell_size.x * vector
		moved(direction)
		return true
		
	else:
		print("Player movement is blocked.")
		return false
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
