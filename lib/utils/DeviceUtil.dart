import 'dart:io';
import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:custom_platform_device_id/platform_device_id.dart';

import '../models/device_model.dart';

class Deviceutil {
  static Future<DeviceModel> getDeviceInfo() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      var device = await deviceInfo.androidInfo;
      const androididPlugin = AndroidId();
      var deviceID = await androididPlugin.getId();
      deviceID ??= await PlatformDeviceId.getDeviceId;
      return DeviceModel(
        deviceId: deviceID,
        deviceName: device.model,
        deviceOs: 'Android',
        deviceOsVersion:
            '${device.version.release} (${device.version.codename})',
      );
    } else if (Platform.isIOS) {
      var device = await deviceInfo.iosInfo;
      return DeviceModel(
        deviceId: device.identifierForVendor,
        deviceName: device.name,
        deviceOs: 'iOS',
        deviceOsVersion: '${device.systemVersion} (${device.systemName})',
      );
    }
    return DeviceModel();
  }
}