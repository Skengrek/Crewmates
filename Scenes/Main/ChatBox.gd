extends LineEdit

func _ready():
	pass # Replace with function body.



func _on_ChatBox_text_entered(new_text):
	print(new_text)
	
	text = ''
	Network.sendMessageToServer('Message|'+ GameData.pseudo + '|' +new_text)
