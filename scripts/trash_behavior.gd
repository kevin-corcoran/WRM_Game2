extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _init():
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
#	get_node("/root/Node/Player/Bins/Area2D").connect("body_enter", self, "_on_body_entered")
#	get_node().connect("body_entered", self, "_on_body_entered")
	print("connecting")

	
#func _on_body_entered(body):
##	body.free()
#	print("collision!")
##	pass

func _process(delta):
	# Called every frame. Delta is time since last frame.
	# Update game logic here.
#	print("process")
	var collision = move_and_collide(Vector2(0, 1).normalized() * 2)
	if collision:
		print("collision!")
		self.free()
#	pass
