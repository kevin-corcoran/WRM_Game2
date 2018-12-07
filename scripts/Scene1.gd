extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var bins = ['paper','bcp','compost','landfill']


func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
#	trash()
	for x in range(2):
		random_trash()
	pass
	
func trash():
	var rigid_body = RigidBody2D.new()
	rigid_body.position = Vector2(get_viewport().size.x/2, get_viewport().size.y/2)
	add_child(rigid_body)
	var sprite = Sprite.new()
	sprite.texture = Resources.trash['paper'][0]
	rigid_body.add_child(sprite)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass

func random_trash():
	var x_pos = randi() % int(get_viewport().size.x - get_viewport().size.x / 4)
	var y_pos = 0
	
	var bin_type = bins[randi() % bins.size()]
	var trash_ind = randi() % Resources.trash.size() 
	
	var rigid_body = RigidBody2D.new()
	rigid_body.position = Vector2(x_pos, y_pos)
	add_child(rigid_body)
	var sprite = Sprite.new()
	sprite.texture = Resources.trash[bin_type][trash_ind]
	rigid_body.add_child(sprite)

