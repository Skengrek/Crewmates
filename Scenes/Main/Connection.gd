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
	pass # Connect to server
