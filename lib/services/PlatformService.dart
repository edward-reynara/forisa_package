import '../models/platform_model.dart';
import 'package:package_info_plus/package_info_plus.dart';

class PlatformService {
  PlatformModel? _platformModel;

  Future<PlatformModel> getPlatformInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (_platformModel == null) {
      _platformModel = PlatformModel(
          appName: packageInfo.appName,
          packageName: packageInfo.packageName,
          version: packageInfo.version,
          buildNumber: packageInfo.buildNumber);
    }
    return _platformModel!;
  }
}
