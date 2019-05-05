extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var bins = ['paper','bcp','compost','landfill']
onready var my_timer = get_node("Timer") # get node reference
var trash = []
func _ready():
	pass

func _process(delta):
	pass
	
func trash():
	var rigid_body = RigidBody2D.new()
	rigid_body.position = Vector2(get_viewport().size.x/2, get_viewport().size.y/2)
	add_child(rigid_body)
	var sprite = Sprite.new()
	sprite.texture = Resources.trash['paper'][0]
	rigid_body.add_child(sprite)


func random_trash():
	var x_pos = randi() % int(get_viewport().size.x - get_viewport().size.x / 4)
	var y_pos = 0
	
	var bin_type = bins[randi() % bins.size()]
	var trash_ind = randi() % Resources.trash[bin_type].size() 
	
	var rigid_body = RigidBody2D.new()
	rigid_body.position = Vector2(x_pos, y_pos)
	add_child(rigid_body)
	
	var sprite = Sprite.new()
	sprite.texture = Resources.trash[bin_type][trash_ind]
	rigid_body.add_child(sprite)
	
	
	var shape = RectangleShape2D.new()
	#resize the shape to be the same size as the sprite texture
	shape.set_extents(Vector2(sprite.get_texture().get_width()/2,sprite.get_texture().get_height()/2))    
	var collision_shape = CollisionShape2D.new()
	collision_shape.set_shape(shape)
	rigid_body.add_child(collision_shape)
	
	connect("body_entered", rigid_body, "_on_body_entered")
	
func _on_body_entered(body):
#	body.free()
	print("collision!")
#  if body.get_name() == "player":
#    body.hit_by_enemy()
	

# Timer node set to call random_trash() every 1 second in the inspector, programatically changed everytime after.
func _on_Timer_timeout():
	random_trash()
	my_timer.wait_time = rand_range(2,10)
#	pass # replace with function body
