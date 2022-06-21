extends Node

var ready = false 
var playerDict = {}
var pseudo = null

func _ready():
	pass # Replace with function body.

func addPlayer(playerName, readyState):
	playerDict[playerName] = {'state':readyState}
	
func newReadyState(playerName, newState):
	playerDict[playerName]['state'] = newState

func updateLobbyState(dictData):
	pass
