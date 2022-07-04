extends Node

var ready = false 
var playerDict = {}
var pseudo = 'Sken'
var chat = ''
var chatNotProcess = ''

func _ready():
	pass # Replace with function body.

func addPlayer(id, playerName, readyState):
	playerDict[id] = {'pseudo': playerName,'state':readyState}
	
func newReadyState(playerId, newState):
	playerDict[playerId]['state'] = newState

func updateLobbyState(dictData):
	pass

func addChatMessage(pseudo, message):
	chatNotProcess += '['+pseudo+']: ' + message + '\n'

func processChat():
	chat += chatNotProcess
	
	var valRen = chatNotProcess
	chatNotProcess = ''
	return valRen
