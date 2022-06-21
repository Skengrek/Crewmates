extends Node


class_name Server


var playerDict = {}


func _ready():
	pass # Replace with function body.


# Players ######################################################################
func addPlayer(playerId):
	playerDict[playerId] = {}


func removePlayer(playerId):
	playerDict.remove(playerId)

