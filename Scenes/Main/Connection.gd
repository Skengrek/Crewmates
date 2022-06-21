extends Control


func _ready():
	pass # Replace with function body.


func _process(delta):
	if $ConnectionPannel/Layout/PseudoCont/PseudoEdit.text == '':
		$ConnectionPannel/Layout/CenterContainer/ConnecButton.disabled = true
		$ConnectionPannel/Layout/CenterContainer/HostButton.disabled = true
	else:
		$ConnectionPannel/Layout/CenterContainer/ConnecButton.disabled = false
		$ConnectionPannel/Layout/CenterContainer/HostButton.disabled = false


# Option Panel #################################################################
func _on_ToolButton_pressed():
	# open parameters
	$OptionPanel.visible = true


func _on_CloseOption_pressed():
	$OptionPanel.visible = false


# Start connection to server ###################################################
func _on_ConnecButton_pressed():
	var pseudo = $ConnectionPannel/Layout/PseudoCont/PseudoEdit.text
	Network.connectToServer($OptionPanel/VBoxContainer/IP/LineEdit.text)
	enableLobby()

func _on_HostButton_pressed():
	Network.hostServer()
	enableLobby()
	
func enableLobby():
	$ConnectionPannel.visible = false
	$ServerContainer.visible = true
	var _pseudo = $ConnectionPannel/Layout/PseudoCont/PseudoEdit.text
	# Clean the pseudo to ease the process of message
	_pseudo = _pseudo.replace('|', '_')
	_pseudo = _pseudo.replace(':', '_')
	GameData.pseudo = _pseudo
	GameData.addPlayer(_pseudo, false)
