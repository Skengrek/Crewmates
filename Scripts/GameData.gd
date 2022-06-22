extends Node

var ready = false 
var playerDict = {}
var pseudo = null

func _ready():
	pass # Replace with function body.

func addPlayer(id, playerName, readyState):
	playerDict[id] = {'pseudo': playerName,'state':readyState}
	
func newReadyState(playerId, newState):
	playerDict[playerId]['state'] = newState

func updateLobbyState(dictData):
	pass
