extends VBoxContainer


func _ready():
	var file = File.new()
	file.open("res://resources/help.txt", file.READ)
	$HelpText.text = file.get_as_text()
	file.close()


