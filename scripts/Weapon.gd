extends VBoxContainer


var message = ""
var damage = 0


func get_hit_location(hit_roll):
	return $"/root/global".get_hit_location(hit_roll)


func d10():
	return $"/root/global".d10()


func dPercent():
	return $"/root/global".dPercent()
	

func set_hit_output(message):
	$OutputLabel.text = message


func roll_to_hit(var ulrich = false):
	var results = ""
	var hit = false
	var hit_roll = dPercent()
	var hit_chance = $AttackSkill.get_value() + $HitModifier.get_value()
	var margin = hit_chance - hit_roll
	
	results += "Roll: " + str(hit_roll) + " against " + str(hit_chance)
	if margin >= 0:
		results += "\n" + "Hit the " + get_hit_location(hit_roll) + " by " + str(margin) + "%"
		hit = true
	else:
		results += "\n" + "Missed by " + str(-1 * margin) + "%"
		hit = false
	
	if not ulrich:
		message += results
	return hit


func roll_damage():
	damage = 0
	var roll = d10()
	damage += $BaseDamage.get_value() + roll
	
	if roll == 10 and roll_to_hit(true):
		damage = ulrichs_fury(damage)
	
	message += "\n" + "Damage: " + str(damage)
	

func ulrichs_fury(damage):
	message += "\n" + "Ulrich's Fury!"
	var roll = d10()
	damage += roll
	if roll == 10:
		damage = ulrichs_fury(damage)
	return damage

	
func _on_Attack_button_up():
	message = ""
	var hit = roll_to_hit()
	if hit:
		roll_damage()
	set_hit_output(message)
	
