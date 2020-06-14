extends SpinBox


func _on_PlusButton_button_up():
	self.value += 1


func _on_MinusButton_button_up():
	self.value -= 1
