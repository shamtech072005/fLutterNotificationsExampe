import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  static final FlutterLocalNotificationsPlugin _plugin =
  FlutterLocalNotificationsPlugin();

  static Future<void> initialize() async {
    const AndroidInitializationSettings androidSettings =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    const InitializationSettings initSettings =
    InitializationSettings(android: androidSettings);

    await _plugin.initialize(initSettings);
  }

  static Future<void> requestPermission() async {
    await _plugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future<void> showNotification({
    String title = 'Hello!',
    String body = 'This is a test notification triggered by a button press.',
  }) async {
    const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      channelDescription: 'Your channel description',
      importance: Importance.max,
      priority: Priority.high,
    );

    const NotificationDetails notificationDetails =
    NotificationDetails(android: androidDetails);

    await _plugin.show(
      0,
      title,
      body,
      notificationDetails,
    );
  }
}
