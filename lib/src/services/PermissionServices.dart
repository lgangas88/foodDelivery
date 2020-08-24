import 'package:permission_handler/permission_handler.dart';

class PermissionServices {

  static Future<PermissionStatus> hasGeolocationPermission() async {
    return await Permission.location.request();
  }

}