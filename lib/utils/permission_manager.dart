import 'dart:io';
import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionManager {
  static Future<bool> requestCameraPermission() async {
    final status = await Permission.camera.status;

    if (!status.isGranted) {
      final status = await Permission.camera.request();
      return _handleStatus(status);
    }

    return _handleStatus(status);
  }

  static Future<bool> requestPhotosPermission() async {
    if (Platform.isAndroid) {
      log("platform is  android");

      try {
        final deviceInfoPlugin = DeviceInfoPlugin();
        final androidInfo = await deviceInfoPlugin.androidInfo;

        log(
          'Android ${androidInfo.version.release} (SDK ${androidInfo.version.sdkInt})',
        );
        final sdkInt = androidInfo.version.sdkInt;
        if (sdkInt >= 33) {
          final status = await Permission.photos.status;

          if (!status.isGranted) {
            final status = await Permission.photos.request();
            return _handleStatus(status);
          }

          return _handleStatus(status);
        } else {
          final status = await Permission.storage.status;
          log("status is $status");
          if (!status.isGranted) {
            final status = await Permission.storage.request();
            return _handleStatus(status);
          }
          return _handleStatus(status);
        }
      } catch (e) {
        log("'Unable to get Android version' $e");
        return false;
      }
    }
    log("platform is not android");

    final status = await Permission.photos.status;

    if (!status.isGranted) {
      final status = await Permission.photos.request();
      return _handleStatus(status);
    }

    return _handleStatus(status);
  }

  static bool _handleStatus(PermissionStatus status) {
    if (status.isGranted) {
      return true;
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }

    return false;
  }
}
