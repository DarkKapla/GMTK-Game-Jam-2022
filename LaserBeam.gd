extends Line2D

export (PackedScene) var laser_beam_scene

var life_time = 1.0


func _ready():
	pass


func _process(delta):
	life_time -=  delta
	self.default_color.a = life_time
	if life_time < 0.0:
		get_parent().remove_child(self)
