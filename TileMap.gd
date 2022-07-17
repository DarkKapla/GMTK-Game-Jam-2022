extends TileMap

enum Tile {EMPTY, WALL}


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func is_empty_cell(cell_coord):
	return get_cellv(cell_coord) != 1
