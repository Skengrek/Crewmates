extends Node

var port = 6970
var network = NetworkedMultiplayerENet.new()
var maxPlayer = 20
var isServer = false
var server = null
var time = 0.0

# Process ######################################################################
func _process(delta):
	if isServer:
		time += delta
		if time >= 0.5:
			rpc_id(0, 'processMessage', generateUpdateLobbyString())

# Connect to another server ####################################################
func connectToServer(newIp):
	print('Start creation of the Client')
	network.create_client(newIp, port)
	get_tree().set_network_peer(network)
	
	network.connect("connection_succeeded", self, "onConnSucceeded")
	network.connect("connection_failed", self, "onConnfailed")
	print('Client is connected')

func onConnSucceeded():
	print('Connected to server')
	sendMessageToServer('Connect|'+str(GameData.pseudo))
	
func onConnFailed():
	print('Failed Connection to server')
	
# Host Server ##################################################################
func hostServer():
	print('Start creation of the server')
	isServer = true
	network.create_server(port, maxPlayer)
	get_tree().set_network_peer(network)
	
	network.connect("peer_connected", self, "onPeerConnected")
	network.connect("peer_disconnected", self, "onPeerDisconnected")
	print('Server Created')
	
func onPeerConnected(playerId):
	print(playerId, ' is connected')
	
	
func onPeerDisconnected(playerId):
	print(playerId, ' is disconnected')


# Dialog with the server #######################################################
func sendMessageToServer(msg):
	if isServer:
		server.receivedMessage(null, msg)
	else:
		rpc_id(1, 'processMessage', msg)
		
remote func processMessage(msg):
	var split = msg.rsplit('|')
	var dataDict = {}
	print(split)
	var command = split[0]
	if command == 'Connect':
		GameData.addPlayer(split[-1], false)
	if command == 'UpdateLobby':
		split.remove(0)
		for data in split:
			var splitedData = data.rsplit(':')
			if not splitedData[0] in GameData.playerDict:
				GameData.addPlayer(splitedData[0], splitedData[1])
			else:
				GameData.newReadyState(splitedData[0], splitedData[1])

func generateUpdateLobbyString():
	var strRen = 'UpdateLobby'
	for key in GameData.playerDict:
		var value = GameData.playerDict[key]['state']
		strRen += '|' + str(key) + ':' + str(value)
	print(strRen)
	return strRen
