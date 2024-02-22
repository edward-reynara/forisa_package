import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import '../configs/config_constants.dart';
import '../interfaces/ConnectivityInterface.dart';
import '../utils/AlertUtil.dart';

class ConnectivityService implements IConnectivityService {
  final Connectivity _connectivity = Connectivity();
  ConnectivityResult? _connectivityResult;
  final AlertUtil _alertUtil;

  ConnectivityService(BuildContext context)
      : _alertUtil = AlertUtil(context) {
    if (_connectivityResult == null) {
      _connectivity.onConnectivityChanged.listen((event) {
        if(_connectivityResult != event){
          if (event == ConnectivityResult.none) {
            _alertUtil.showSnackbar(ConfigConstant.ALERT_INFO, 'No internet connection. Please check your network.', AlertStatus.info, persistent: true);
          }
        }
        _connectivityResult = event;
      });
    }
  }

  @override
  bool isNetworkAvailable() {
    return _connectivityResult != ConnectivityResult.none;
  }
}
