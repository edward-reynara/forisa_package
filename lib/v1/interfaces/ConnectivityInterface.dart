import 'dart:async';

abstract class IConnectivityService {
  FutureOr<bool> isNetworkAvailable();
}
