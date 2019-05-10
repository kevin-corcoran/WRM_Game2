extends Node

var landfill_bin = load("res://assets/landfill_bin.png")
var compost_bin = load("res://assets/compost_bin.png")
var bcp_bin = load("res://assets/bcp_bin.png")
var paper_bin = load("res://assets/paper_bin.png")

var landfill_items = dir_contents("res://assets/landfill/")
var compost_items = dir_contents("res://assets/compost/")
var bcp_items = dir_contents("res://assets/bcp/")
var paper_items = dir_contents("res://assets/paper/")

#var states = [landfill_bin, compost_bin, bcp_bin, paper_bin]
#var current_state = 0;

var trash = {
	'landfill' : [],
	'compost' : [],
	'bcp' : [],
	'paper' : []

}

func _ready():
	for item in landfill_items:
		trash['landfill'].append(load(item))
	for item in compost_items:
		trash['compost'].append(load(item))
	for item in bcp_items:
		trash['bcp'].append(load(item))
	for item in paper_items:
		trash['paper'].append(load(item))
		

#func _process(delta):

func dir_contents(path):
	var contents = []
	var dir = Directory.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while (file_name != ""):
			if dir.current_is_dir():
				print("Found directory: " + file_name)
			else:
				print("Found file: " + file_name)
			file_name = dir.get_next()
			if (file_name.ends_with(".png")):
				contents.append(path + file_name)
	else:
		print("An error occurred when trying to access the path.")
	return contents
