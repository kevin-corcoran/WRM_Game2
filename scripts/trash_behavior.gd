extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var states = ["landfill", "compost", "bcp", "paper"]
var should_collide = true

func _init():
	print("trash_behavior.gd")
	print(self.get_name())
#	self.set_collision_mask(3)
##	print(self.get_collision_mask())
##	print(self.get_collision_layer())
#	self.set_collision_layer()
#	print(self.get_collision_mask())
#	print(self.get_collision_layer())

	pass
#	print("called?")
#	print(get_node("/root/Node/Player/Bins/Area2D"))
#	get_node("/root/Node/Player/Bins/Area2D").connect("body_enter", self, "_on_body_entered")
#	get_node("/root").connect("body_enter", self, "_on_body_entered")
#	_ready()
#	_process()
#	print(bin_type)
	
# doesn't get called for some reason
func _ready():
	pass
	# Called when the node is added to the scene for the first time.
	# Initialization here
#	print("node", get_node("/root/Node/Player/Bins"))
#	get_node("/root/Node/Player/Bins/Area2D/CollisionShape2D").connect("body_enter", self , "_on_body_entered")
	var collision_shape
	for child in self.get_children():
		if child is Area2D:
			collision_shape = child.get_child(0)

	get_node("/root/Node/Player/Bins/Area2D/CollisionShape2D").connect("body_enter", collision_shape, "_on_body_entered")
##	get_node().connect("body_entered", self, "_on_body_entered")
	print("connecting")
#
#
#func _on_body_entered(body):
##	body.free()
#	print("collision!")
##	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
#	print("process")
	var collision = move_and_collide(Vector2(0, 1).normalized() * 2)
#	print(get_viewport().size.y - 10)
#	print(self.position.y)
# checkPosition() to change collision layer...... or set flag
	if should_collide and self.collision_layer != 1:
		self.set_collision_layer(1)
		self.set_collision_mask(1)
		
	if collision:
		if str(states[Resources.current_state]) == self.get_name():
			self.free() # remove trash from game
			# increase score...
		else:
			self.set_collision_layer(2)
			self.set_collision_mask(2)
			should_collide = false
#	else if self.position.y + self.sprite.get _texture().height/2 > get_viewport().y - get_node("/root/Node/Player/Bins").get_texture().height:
#		should_collide = false
#		self.set_collision_layer(2)
#		self.set_collision_mask(2)
#	pass

