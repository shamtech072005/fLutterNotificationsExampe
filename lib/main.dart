import 'package:flutter/material.dart';
import 'local_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalNotifications.initialize();
  await LocalNotifications.requestPermission();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Demo',
      home: NotificationPage(),
    );
  }
}

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notification Demo')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            LocalNotifications.showNotification(
              title: 'Hi!',
              body: 'Button was pressed and this notification popped!',
            );
          },
          child: const Text('Show Notification'),
        ),
      ),
    );
  }
}
