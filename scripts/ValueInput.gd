extends VBoxContainer
tool


export(String) var title setget set_title
export(bool) var tens_buttons setget set_tens_buttons
export(bool) var ones_buttons setget set_ones_buttons


func set_title(text):
	title = text
	$TopContainer/Label.text = text

func set_tens_buttons(tens):
	tens_buttons = tens
	if tens:
		$BottomContainer/Min10.visible = true
		$BottomContainer/Plus10.visible = true
	else:
		$BottomContainer/Min10.visible = false
		$BottomContainer/Plus10.visible = false
		
func set_ones_buttons(ones):
	ones_buttons = ones
	if ones:
		$BottomContainer/Min1.visible = true
		$BottomContainer/Plus1.visible = true
	else:
		$BottomContainer/Min1.visible = false
		$BottomContainer/Plus1.visible = false
		


func _on_Min10_button_up():
	$TopContainer/SpinBox.value -= 10


func _on_Min1_button_up():
	$TopContainer/SpinBox.value -= 1


func _on_Plus1_button_up():
	$TopContainer/SpinBox.value += 1
	

func _on_Plus10_button_up():
	$TopContainer/SpinBox.value += 10
	