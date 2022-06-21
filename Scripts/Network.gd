extends Node

var port = 6970
var network = NetworkedMultiplayerENet.new()
var maxPlayer = 20
var isServer = false
var server = null

# Connect to another server ####################################################
func connectToServer(newIp):
	network.create_client(newIp, port)
	get_tree().set_network_peer(network)
	
	network.connect("connection_succeeded", self, "onConnSucceeded")
	network.connect("connection_failed", self, "onConnfailed")

func onConnSucceeded():
	print('Connected to server')
	sendMessageToServer('Connect|'+GameData.pseudo)
	
func onConnFailed():
	print('Failed Connection to server')
	
# Host Server ##################################################################
func hostServer():
	isServer = true
	server = Server.new()
	network.create_server(port, maxPlayer)
	get_tree().set_network_peer(network)
	
	network.connect("peer_connected", self, "onPeerConnected")
	network.connect("peer_disconnected", self, "onPeerDisconnected")
	
func onPeerConnected(playerId):
	print(playerId, ' is connected')
	
	
func onPeerDisconnected(playerId):
	print(playerId, ' is disconnected')


# Dialog with the server #######################################################
func sendMessageToServer(msg):
	if isServer:
		server.receivedMessage(null, msg)
	else:
		network.rpc_id(1, 'processMessage', msg)
		
func processMessage(id, msg):
	print(id, ' ', msg)
