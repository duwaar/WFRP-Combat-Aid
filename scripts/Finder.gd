extends VBoxContainer

var crit_effects
var crit_values
var timer = 0.0
var printed = false
var message = ""



func load_from_json(path):
	return $"/root/global".load_from_json(path)

func _ready():
	crit_effects = load_from_json("res://resources/critical_effects.json")
	crit_values = load_from_json("res://resources/critical_values.json")
	
	
func _process(delta):
	if not printed:
		timer -= delta
		if timer < 0:
			$Output.text = message
			message = ""
			printed = true


func d10():
	return $"/root/global".d10()


func dPercent():
	return $"/root/global".dPercent()


func get_hit_location(hit_roll):
	return $"/root/global".get_hit_location(hit_roll)


func get_critical_value(crit_damage, percent):
	return int(crit_values[floor(percent / 10)][int(crit_damage)])


func get_critical_effect(hit_location, crit_value):
	if "arm" in hit_location:
		hit_location = "arm"
	elif "leg" in hit_location:
		hit_location = "leg"
	
	if $HBoxContainer/Damage.get_value() == 0:
		return "No critical."
	else:
		return str(crit_effects[hit_location][crit_value - 1])


func _on_CalculateButton_button_up():
	if timer < 0:
		var location = get_hit_location(int($HBoxContainer/Hit.get_value()))
		message += "Location: " + location + "\n"
	
		var crit_value
		if int($HBoxContainer/Hit.get_value()) == 0:
			crit_value = 0
		else:
			var effect_roll = dPercent()
			crit_value = int( crit_values[floor(effect_roll / 10)][int($HBoxContainer/Damage.get_value()) - 1] )
			message += "Critical Effect Roll: " + str(effect_roll) + "\n"
			message += "Critical Value: " + str(crit_value) + "\n"
	
		var crit_effect = get_critical_effect(location, crit_value)
		message += "\n"
		message += crit_effect
	
		$Output.text = "Loading..."
		timer = 0.5
		printed = false
	
