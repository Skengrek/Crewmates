extends Node


class_name Server

var state = 'Lobby'
var playerDict = {}
var timePassed = 0.0

func _ready():
	pass # Replace with function body.

func _process(delta):
	timePassed += delta
	print(timePassed)
	if timePassed>=0.25:
		timePassed = 0
		if state == 'Lobby':
			rpc_id(0, 'processMessage', 'Test')
		
# Players ######################################################################
func addPlayer(playerId):
	playerDict[playerId] = {'state': false}


func removePlayer(playerId):
	playerDict.remove(playerId)
	
