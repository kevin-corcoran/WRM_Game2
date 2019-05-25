 extends KinematicBody2D

var speed = 3
var move_direction = Vector2(0, 0)
#var states = [Resources.landfill_bin, Resources.compost_bin, Resources.bcp_bin, Resources.paper_bin]
#var current_state = 0;
#var comp_text = load("res://assets/compost_bin.png")
# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
#	pass


	var s = Vector2()
	s = get_viewport().size
	s.x = s.x / 2
	s.y -= get_node("Sprite").texture.get_height()/4
	get_node(".").position = s

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
	move_player()
	# "key_a" and "key_d" set in InputMap tab in project settings
	if(Input.is_action_just_pressed("key_a")):
		var new_state = Resources.current_state - 1
		new_state = new_state % Resources.states.size()
		Resources.current_state = new_state
		get_node("Sprite").texture = Resources.states[Resources.current_state]
	if(Input.is_action_just_pressed("key_d")):
		var new_state = Resources.current_state + 1
		new_state = new_state % Resources.states.size()
		Resources.current_state = new_state
		get_node("Sprite").texture = Resources.states[Resources.current_state]

func move_player():
	move_direction = Vector2(0,0)
	if(Input.is_key_pressed(KEY_LEFT)):
		move_direction += Vector2(-1, 0)
	if(Input.is_key_pressed(KEY_RIGHT)):
		move_direction += Vector2(1, 0)
#	if(Input.is_key_pressed(KEY_W)):
#		move_direction += Vector2(0, -1)
#	if(Input.is_key_pressed(KEY_S)):
#		move_direction += Vector2(0, 1)
	move_and_collide(move_direction.normalized() * speed)
	
func _on_body_entered(body):
#	body.free()
	print("collision!! in bins !!!!")
