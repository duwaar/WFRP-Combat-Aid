extends SpinBox


func _on_Minus10Button_button_up():
	self.value -= 10


func _on_Minus1Button_button_up():
	self.value -= 1


func _on_Plus1Button_button_up():
	self.value += 1


func _on_Plus10Button_button_up():
	self.value += 10
