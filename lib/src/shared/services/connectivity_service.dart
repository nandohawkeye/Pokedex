import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@singleton
class ConnectivityService {
  Stream<bool> isConnectedStream() => Connectivity()
      .onConnectivityChanged
      .map((event) => event != ConnectivityResult.none);

  Future<bool> getConnected() async {
    final result = await (Connectivity().checkConnectivity());

    if (result == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}
