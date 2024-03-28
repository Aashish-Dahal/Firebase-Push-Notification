import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  LocalNotificationService._();
  static LocalNotificationService get instance => LocalNotificationService._();
  final FlutterLocalNotificationsPlugin localNotificationPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    // Initialize native android notification
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    // Initialize native Ios Notifications
    const DarwinInitializationSettings initializationSettingsIOS =
        DarwinInitializationSettings();

    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    await localNotificationPlugin.initialize(
      initializationSettings,
    );
  }

  void showAndroidNotification(
      String? title, String? value, String? imageUrl) async {
    AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails('channel_id', 'Channel Name',
            channelDescription: 'Channel Description',
            importance: Importance.max,
            priority: Priority.high,
            styleInformation: imageUrl == null
                ? null
                : BigPictureStyleInformation(FilePathAndroidBitmap(imageUrl)),
            ticker: 'ticker');
    const int notificationId = 1;
    NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await localNotificationPlugin.show(
        notificationId, title, value, notificationDetails,
        payload: 'data');
  }

  void showIosNotification(String title, String value) async {}
}
