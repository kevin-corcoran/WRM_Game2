extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var bins = ['paper','bcp','compost','landfill']
onready var my_timer = get_node("Timer") # get node reference
#var trash_objects = {}
#var num_trash = 0
#var velocity = rand_range(4, 10)

func _ready():
	pass

func _process(delta):
	pass
#	for trash in trash_objects:
##		print(num_trash)
#		trash.move_and_collide(Vector2(0, -velocity)*delta)
	
func trash():
	var rigid_body = RigidBody2D.new()
	rigid_body.position = Vector2(get_viewport().size.x/2, get_viewport().size.y/2)
	add_child(rigid_body)
	var sprite = Sprite.new()
	sprite.texture = Resources.trash['paper'][0]
	rigid_body.add_child(sprite)


func random_trash():
	var x_pos = randi() % int(get_viewport().size.x - get_viewport().size.x / 3)
	var y_pos = 0
	
	var bin_type = bins[randi() % bins.size()]
	var trash_ind = randi() % Resources.trash[bin_type].size() 
	
#	print(bin_type)
#	var node = Node.new()
	var body = KinematicBody2D.new()
	body.set_name(bin_type)
	body.position = Vector2(x_pos, y_pos)
#	node.add_child(body)
	add_child(body)
	
	var sprite = Sprite.new()
	sprite.texture = Resources.trash[bin_type][trash_ind]
	body.add_child(sprite)
	
	
	var shape = RectangleShape2D.new()
	#resize the shape to be the same size as the sprite texture
	shape.set_extents(Vector2(sprite.get_texture().get_width()/2, sprite.get_texture().get_height()/2))    
	var collision_shape = CollisionShape2D.new()
	collision_shape.set_shape(shape)
	body.add_child(collision_shape)

	
	# might not be necessary
	var area = Area2D.new()
	var area_collision = CollisionShape2D.new()
	var area_shape = RectangleShape2D.new()
	area_shape.set_extents(Vector2(sprite.get_texture().get_width()/2, sprite.get_texture().get_height()/2)) 
	area_collision.set_shape(area_shape)
	area.add_child(area_collision)
	body.add_child(area)
	
	body.set_script(load("res://scripts/trash_behavior.gd"))
	body.notification(NOTIFICATION_READY)
	body.name = bin_type
#	print("TrashScene.gd")
#	print(body.name)
#	print(bin_type)
	
			
#	num_trash += num_trash
#	trash_objects[num_trash] = body
#	num_trash += num_trash
#	body.move_and_collide(Vector2(0, -1))
#	body.set_process(
	
#	connect("body_entered", body, "_on_body_entered")
#
#func _on_body_entered(body):
##	body.free()
#	print("collision! in trashscene")
##  if body.get_name() == "player":
 
	

# Timer node set to call random_trash() every 1 second in the inspector, programatically changed everytime after.
func _on_Timer_timeout():
	random_trash()
	my_timer.wait_time = rand_range(3,7)
	
#	pass # replace with function body
