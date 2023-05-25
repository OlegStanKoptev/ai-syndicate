import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications')),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Your project has received new investment!'),
            subtitle: Text('5 seconds ago'),
          ),
        ],
      ),
    );
  }
}
