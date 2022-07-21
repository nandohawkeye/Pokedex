import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';

@singleton
class ConnectivityService {
  Stream<bool> get isConnectedStream => Connectivity()
      .onConnectivityChanged
      .map((event) => event != ConnectivityResult.none);

  Future<bool> getConnected() async =>
      await (Connectivity().checkConnectivity())
          .then((value) => value != ConnectivityResult.none);
}
