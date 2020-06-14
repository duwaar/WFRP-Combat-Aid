extends Node2D


var hit_locations
var crit_effects
var crit_values
var timer = 0.0
var printed = false
var message = ""


func _ready():
	crit_effects = load_from_json("res://critical_effects.json")
	crit_values = load_from_json("res://critical_values.json")
	hit_locations = load_from_json("res://hit_locations.json")
	randomize() # Generate a new seed for the random number generator


func _process(delta):
	if not printed:
		timer -= delta
		if timer < 0:
			$OutputBox/TextArea.text = message
			message = ""
			printed = true


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


func d10():
	return floor(randf() * 10)


func get_hit_location(hit_roll):
	# Swap the digits from the to-hit roll.
	var digit_10 = floor(hit_roll / 10)
	var digit_1 = hit_roll % 10
	var location_roll = digit_1 * 10 + digit_10
	
	if location_roll == 0:
		location_roll = 100
	
	return str(hit_locations[location_roll - 1])


func get_critical_value(crit_damage, percent):
	return int(crit_values[floor(percent / 10)][int(crit_damage)])


func get_critical_effect(hit_location, crit_value):
	if "arm" in hit_location:
		hit_location = "arm"
	elif "leg" in hit_location:
		hit_location = "leg"
	
	if $DamageBox.value == 0:
		return "No critical."
	else:
		return str(crit_effects[hit_location][crit_value - 1])


func _on_CalculateButton_button_up():
	if timer < 0:
		var location = get_hit_location(int($HitBox.value))
		message += "Location: " + location + "\n"
	
		var crit_value
		if int($DamageBox.value) == 0:
			crit_value = 0
		else:
			var effect_roll = d10() * 10 + d10() + 1
			crit_value = int( crit_values[floor(effect_roll / 10)][int($DamageBox.value) - 1] )
			message += "Critical Effect Roll: " + str(effect_roll) + "\n"
			message += "Critical Value: " + str(crit_value) + "\n"
	
		var crit_effect = get_critical_effect(location, crit_value)
		message += "\n"
		message += crit_effect
	
		$OutputBox/TextArea.text = "Loading..."
		timer = 0.5
		printed = false
	
