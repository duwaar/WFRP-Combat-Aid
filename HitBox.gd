extends SpinBox

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Minus10Button_button_up():
	self.value -= 10


func _on_Minus1Button_button_up():
	self.value -= 1


func _on_Plus1Button_button_up():
	self.value += 1


func _on_Plus10Button_button_up():
	self.value += 10