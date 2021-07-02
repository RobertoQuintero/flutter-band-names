import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus { OnLine, OffLine, Connecting }

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;
  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket;
  SocketService() {
    _initConfig();
  }

  void _initConfig() {
    this._socket = IO.io('http://192.168.1.68:3000', {
      'transports': ['websocket'],
      'autoConnect': true
    });
    this._socket.onConnect((_) {
      this._serverStatus = ServerStatus.OnLine;
      notifyListeners();
    });
    this._socket.onDisconnect((_) {
      this._serverStatus = ServerStatus.OffLine;
      notifyListeners();
    });

    // _socket.on('nuevo-mensaje', (payload) {
    //   print('nuevo mensaje: $payload');
    // });
  }
}
