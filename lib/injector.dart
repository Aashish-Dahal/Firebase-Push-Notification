import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:fpn/services/fcm/index.dart';
import 'package:fpn/services/lpn/index.dart';

Future<void> initDependencies() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessagingService.instance.initFCM();
  await LocalNotificationService.instance.init();
}
