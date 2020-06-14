extends Node2D


func _ready():
	var file = File.new()
	file.open("res://help_text.txt", file.READ)
	$HelpBox/RichTextLabel.text = file.get_as_text()
	file.close()


