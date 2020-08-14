import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app/src/services/device_info.dart';
import 'package:education_app/src/services/push_notification.dart';

class FireStoreDBService {
  final DeviceInfo _deviceInfo = DeviceInfo();
  final NotifService _notifService = NotifService();

  // Collection (folder) with many docs (users)
  final CollectionReference tokenCollection =
      Firestore.instance.collection('fcmTokens');

  Future updateUserToken(int userId) async {
    String token = await _notifService.getUserToken();
    var cloudObject = await getCloudObject(userId, token);

    if (cloudObject != null) {
      // Write to firestore database
      return await tokenCollection
          .document(cloudObject.keys.first)
          .setData(cloudObject.values.first);
    }
  }

  Future<Map<String, Object>> getCloudObject(int userId, String token) async {
    var myInfo = await _deviceInfo.initPlatformState();
    String device, os, version, deviceId;
    Object cloudObject;

    if (myInfo != null) {
      if (myInfo['os'] == 'android') {
        deviceId = myInfo['androidId'];
        device = myInfo['model'];
        os = myInfo['os'];
        version = myInfo['version.release'];
      } else if (myInfo['os'] == 'ios') {
        deviceId = myInfo['identifierForVendor'];
        device = myInfo['utsname.machine'];
        os = myInfo['os'];
        version = myInfo['utsname.version'];
      }

      // Create the object & return it
      cloudObject = {
        "token": token,
        "device": device,
        "os": os,
        "version": version,
        "userId": userId,
        "timeSaved": Timestamp.now(),
      };
      return {deviceId: cloudObject};
    } else {
      print("ERR_firesotre_fb: deviceInfo is null!");
      return null;
    }
  }
}
