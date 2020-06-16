extends Node


var hit_locations



func _ready():
	hit_locations = load_from_json("res://resources/hit_locations.json")
	randomize() # Generate a new seed for the random number generator
	
	
func d10():
	return int( ceil(randf() * 10) )


func dPercent():
	return int( ceil(randf() * 100) )


func load_from_json(path):
	var file = File.new()
	file.open(path, file.READ)
	var json_object = JSON.parse(file.get_as_text())
	file.close()
	
	if json_object.error == OK:
		return json_object.result
	else:
		print("Error " + str(json_object.error) + " on line " + str(json_object.error_line) + ": " + str(json_object.error_string))
		return {}


func get_hit_location(hit_roll): # hit_roll: int from 01 to (1)00
	if hit_roll == 100:
		hit_roll = 0

	# Swap the digits.
	var digit_10 = floor(hit_roll / 10)
	var digit_1 = hit_roll % 10
	var location_roll = digit_1 * 10 + digit_10
	
	return str(hit_locations[location_roll])


