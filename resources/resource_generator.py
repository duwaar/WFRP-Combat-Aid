#!/usr/bin/env python3

import json

hit_locations = []
for roll in range(1, 101):
    if 1 <= roll <= 15:
        hit_locations.append("head")
    elif 16 <= roll <= 35:
        hit_locations.append("right arm")
    elif 36 <= roll <= 55:
        hit_locations.append("left arm")
    elif 56 <= roll <= 80:
        hit_locations.append("body")
    elif 81 <= roll <= 90:
        hit_locations.append("right leg")
    elif 91 <= roll <= 100:
        hit_locations.append("left leg")

with open("hit_locations.json", "w") as file:
    json.dump(hit_locations, file)



critical_values = [
        ["5", "7", "9", "10", "10", "10", "10", "10", "10", "10"],
        ["5", "6", "8", "9", "10", "10", "10", "10", "10", "10"],
        ["4", "6", "8", "9", "9", "10", "10", "10", "10", "10"],
        ["4", "5", "7", "8", "9", "9", "10", "10", "10", "10"],
        ["3", "5", "7", "8", "8", "9", "9", "10", "10", "10"],
        ["3", "4", "6", "7", "8", "8", "9", "9", "10", "10"],
        ["2", "4", "6", "7", "7", "8", "8", "9", "9", "10"],
        ["2", "3", "5", "6", "7", "7", "8", "8", "9", "9"],
        ["1", "3", "5", "6", "6", "7", "7", "8", "8", "9"],
        ["1", "2", "4", "5", "6", "6", "7", "7", "8", "8"]
    ]
with open("critical_values.json", "w") as file:
    json.dump(critical_values, file)



critical_effects = {
        "head":[
                "Disoriented by the blow. Character can only take a half action on his next turn.",
                "Ears bashed causing ears to ring and head to spin. Character cannot take any actions for 1 round.",
                "The blow inflicts a nasty scalp wound. Blood runs into eyes, causing character to suffer a –10% WS penalty until medical attention is received.",
                "Armour damaged. Armour Points on this location are reduced by 1 until the armour is repaired with a successful Trade (Armourer) Skill Test. If character isn’t wearing any armour or players are using the Basic Armour system, ears bashed causing ears to ring and head to spin. Character cannot take any actions for 1 round.",
                "Knocked to the ground and dazed. All his tests and attacks suffer a –30% penalty for one round and he must use the stand action to regain his feet.",
                "Stunned for 1d10 rounds.",
                "Knocked out for 1d10 minutes. Use the Sudden Death rules for any further Critical Hits on this character.",
                "Face shattered and knocked to the ground. Character is now considered helpless. Blood loss is such that the victim has a 20% chance of dying each round until medical attention is received. Test at the start of his turn each round. Use the Sudden Death rules for any further Critical Hits on this character. If he survives this combat, he must make a successful Toughness Test or lose an eye permanently.",
                "Skull pierced by a mighty blow. Death is instantaneous.",
                "Killed in whatever spectacular and gore-drenched fashion the player or GM cares to describe."
            ],
        "body":[
                "The wind is knocked out of the character. All tests and attacks suffer a –20% penalty for one round.",
                "Struck in the groin. The pain is such that the character cannot take any actions for one round.",
                "Ribs busted by ferocity of attack. Character takes a –10% WS penalty until medical attention is received.",
                "Armour damaged. Armour Points on this location are reduced by 1 until the armour is repaired with a successful Trade (Armourer) Skill Test. If character isn’t wearing any armour or players are using the Basic Armour system, struck in the groin. The pain is such that the character cannot take any actions for one round.",
                "Knocked to the ground and badly winded. All his tests and attacks suffer a –30% penalty for one round and he must use the stand action to regain his feet.",
                "Stunned for 1d10 rounds.",
                "The blow results in serious internal bleeding and the character is helpless. Blood loss is such that the victim has a 20% chance of dying each round until medical attention is received. Test at the start of his turn each round. Use the Sudden Death rules for any further Critical Hits on this opponent.",
                "Spine pulverized and character is knocked to the ground. Character may do nothing until medical attention is received and is considered helpless. Use the Sudden Death rules for any further Critical Hits on this opponent. If he survives this combat, he must make a successful Toughness Test or become permanently paralyzed from the waist down.",
                "Several internal organs are ruptured by the violence of the blow causing death in a matter of seconds.",
                "Killed in whatever spectacular and gore-drenched fashion the player or GM cares to describe."
            ],
        "arm":[
                "Drops anything held in that hand. A shield, if worn, is not affected, since it’s strapped on.",
                "Arm struck numb and cannot be used for 1 round.",
                "Hand incapacitated until medical attention is received. Anything held in this hand is dropped (again, excepting a shield).",
                "Armour damaged. Armour Points on this location are reduced by 1 until the armour is repaired with a successful Trade (Armourer) Skill Test. If character isn’t wearing any armour or players are using the Basic Armour system, arm struck numb and cannot be used for 1 round.",
                "Arm incapacitated until medical attention is received. Anything held in this hand is dropped (excepting a shield).",
                "Arm demolished by attack. Anything held in this hand is dropped (excepting a shield). Blood loss is such that character has a 20% chance of dying each round until medical attention is received. Test at the start of victim’s turn each round. Use the Sudden Death rules for any further Critical Hits on this opponent.",
                "Hand turned into a bloody ruin. Anything held in this hand is dropped (excepting a shield). Blood loss is such that character has a 20% chance of dying each round until medical attention is received. Test at the start of victim’s turn each round. Use the Sudden Death rules for any further Critical Hits on this opponent. If he survives this combat, he must make a successful Toughness Test or lose the hand permanently.",
                "Arm is now a dangling mass of bloody meat. Anything held in this hand is dropped (excepting a shield). Blood loss is such that character has a 20% chance of dying each round until medical attention is received. Test at the start of victim’s turn each round. Use the Sudden Death rules for any further Critical Hits on this opponent. If he survives this combat, he must make a successful Toughness Test or lose the arm from the elbow down permanently.",
                "Major artery severed. After a fraction of a second, character collapses with blood pouring out of the ruins of his shoulder. Death from shock and blood loss is almost instantaneous.",
                "Killed in whatever spectacular and gore-drenched fashion the player or GM cares to describe."
            ],
        "leg":[
                "Stumbles. Character can only take a half action on his next turn.",
                "Leg struck numb by the attack. Character’s Movement Characteristic is reduced to 1 for one round and during that time he cannot dodge and suffers a –20% penalty on related Agility Tests.",
                "Leg incapacitated until medical attention is received. Character’s Movement Characteristic is reduced to 1 and he cannot dodge. Related Agility Tests also suffer a –20% penalty.",
                "Armour damaged. Armour Points on this location are reduced by 1 until the armour is repaired with a successful Trade (Armourer) Skill Test. If character isn’t wearing any armour or players are using the Basic Armour system, leg struck numb by the attack. Character’s Movement Characteristic is reduced to 1 for one round and during that time he cannot dodge and suffers a –20% penalty on related Agility Tests.",
                "Knocked to the ground and dazed. All character’s tests and attacks suffer a –30% penalty for one round and he must use the stand action to regain his feet.",
                "Leg demolished and character is considered helpless. Blood loss is such that the victim has a 20% chance of dying each round until medical attention is received. Test at the start of his turn each round. Use the Sudden Death rules for any further Critical Hits on this character.",
                "Leg is turned into a bloody ruin and character is considered helpless. Blood loss is such that the victim has a 20% chance of dying each round until medical attention is received. Test at the start of his turn each round. Use the Sudden Death rules for any further Critical Hits on this character. If he survives this combat, he must make a successful Toughness Test or lose the foot permanently.",
                "Leg turned into a dangling mass of bloody meat and character is considered helpless. Blood loss is such that the victim has a 20% chance of dying each round until medical attention is received. Test at the start of his turn each round. Use the Sudden Death rules for any further Critical Hits on this character. If he survives this combat, he must make a successful Toughness Test or lose the leg from the knee down permanently.",
                "Major artery severed. After a fraction of a second, character collapses with blood pouring out of the ruins of his leg. Death from shock and blood loss is almost instantaneous.",
                "Killed in whatever spectacular and gore-drenched fashion the player or GM cares to describe."
            ]
        }

with open("critical_effects.json", "w") as file:
    json.dump(critical_effects, file)
