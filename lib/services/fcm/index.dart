import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fpn/services/lpn/index.dart';
import 'package:fpn/utils/index.dart';

class FirebaseMessagingService {
  FirebaseMessagingService._();
  static FirebaseMessagingService get instance => FirebaseMessagingService._();
  final _fcm = FirebaseMessaging.instance;

  Future<void> initFCM() async {
    await _fcm.requestPermission(announcement: true);
    await initNotification();
  }

  Future<void> initNotification() async {
    FirebaseMessaging.onMessage.listen((event) async {
      if (event.notification == null) return;
      final imageUrl =
          await downloadFile(event.notification?.android?.imageUrl, "imageUrl");
      LocalNotificationService.instance.showAndroidNotification(
          event.notification?.title, event.notification?.body, imageUrl);
    });
  }
}
