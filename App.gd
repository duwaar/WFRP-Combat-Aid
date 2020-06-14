extends Node2D



func _on_BackButton_button_up():
	$HelpPage.visible = false
	$ControlPanel.visible = true


func _on_HelpButton_button_up():
	$ControlPanel.visible = false
	$HelpPage.visible = true
