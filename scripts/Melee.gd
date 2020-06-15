extends VBoxContainer



func get_hit_location(hit_roll):
	return $"/root/global".get_hit_location(hit_roll)


func d10():
	return $"/root/global".d10()


func set_hit_output(message):
	$OutputLabel.text = message


func _on_Attack_button_up():
	var message = ""
	var damage = $BaseDamage.get_value() + d10() + 1
	
	var hit_roll = d10()*10 + d10()
	var hit_chance = $WeaponSkill.get_value() + $HitModifier.get_value()
	var margin = hit_chance - hit_roll
	
	message += "Roll: " + str(hit_roll) + " against " + str(hit_chance)
	if margin >= 0:
		message += "\n" + "Hit the " + get_hit_location(hit_roll) + " by " + str(margin) + "%"
		message += "\n" + "Damage: " + str(damage)
	else:
		message += "\n" + "Missed by " + str(-1 * margin) + "%"
	set_hit_output(message)
	
