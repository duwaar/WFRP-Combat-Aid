extends VBoxContainer
tool



export(String) var title = "Title:" setget set_title
export(bool) var tens_buttons = true setget set_tens_buttons
export(bool) var ones_buttons = true setget set_ones_buttons
export(bool) var show_sign = false setget set_show_sign
export(bool) var show_percent = false setget set_show_percent
export(int) var value = 0 setget set_value, get_value
export(int) var max_value = 100 setget set_max_value
export(int) var min_value = 0 setget set_min_value



func set_show_sign(show):
	show_sign = show
	
	
func set_show_percent(show):
	show_percent = show
	if show_percent:
		$TopContainer/SpinBox.suffix = "%"
	else:
		$TopContainer/SpinBox.suffix = ""
	
	
func set_value(new_value):
	if new_value > max_value:
		value = max_value
	elif new_value < min_value:
		value = min_value
	else:
		value = new_value
	$TopContainer/SpinBox.value = value
	
	if value > 0 and show_sign:
		$TopContainer/SpinBox.prefix = "+"
	else:
		$TopContainer/SpinBox.prefix = ""
	
	
func get_value():
	return int($TopContainer/SpinBox.value)


func inc_value(amount):
	set_value( get_value() + amount )


func set_max_value(value):
	max_value = value
	$TopContainer/SpinBox.max_value = value


func set_min_value(value):
	min_value = value
	$TopContainer/SpinBox.min_value = value


func set_title(text):
	if text:
		title = text
		$TopContainer/Label.text = title

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
	inc_value(-10)


func _on_Min1_button_up():
	inc_value(-1)


func _on_Plus1_button_up():
	inc_value(1)
	

func _on_Plus10_button_up():
	inc_value(10)
	