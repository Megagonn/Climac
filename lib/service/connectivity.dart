import 'dart:async';
import 'dart:io';

class Connectivity {
  StreamController connectionChangeController = StreamController.broadcast();

  Future<bool> checkConnection() async {
        bool previousConnection = false;

        try {
            final result = await InternetAddress.lookup('google.com');
            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
                previousConnection = true;
            } else {
                previousConnection = false;
            }
        } on SocketException catch(_) {
            previousConnection = false;
        }

        //The connection status changed send out an update to all listeners
        if (previousConnection != previousConnection) {
            connectionChangeController.add(previousConnection);
        }

        return previousConnection;
    }
}