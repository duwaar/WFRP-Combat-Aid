extends VBoxContainer


var message = ""
var damage = 0


func get_hit_location(hit_roll):
	return $"/root/global".get_hit_location(hit_roll)


func d10():
	return $"/root/global".d10()


func set_hit_output(message):
	$OutputLabel.text = message


func roll_to_hit(var ulrich = false):
	var results = ""
	var hit = false
	var hit_roll = d10()*10 + d10() + 1
	var hit_chance = $WeaponSkill.get_value() + $HitModifier.get_value()
	var margin = hit_chance - hit_roll
	
	results += "Roll: " + str(hit_roll) + " against " + str(hit_chance)
	if margin >= 0:
		results += "\n" + "Hit the " + get_hit_location(hit_roll - 1) + " by " + str(margin) + "%"
		hit = true
	else:
		results += "\n" + "Missed by " + str(-1 * margin) + "%"
		hit = false
	
	if not ulrich:
		message += results
	return hit


func roll_damage():
	damage = 0
	var roll = d10() + 1
	damage += $BaseDamage.get_value() + roll
	
	if roll == 10 and roll_to_hit(true):
		ulrichs_fury()
	
	message += "\n" + "Damage: " + str(damage)
	

func ulrichs_fury():
	message += "\n" + "Ulrich's Fury!"
	var roll = d10() + 1
	damage += roll
	if roll == 10:
		ulrichs_fury()
		
	
func _on_Attack_button_up():
	message = ""
	var hit = roll_to_hit()
	if hit:
		roll_damage()
	set_hit_output(message)
	
