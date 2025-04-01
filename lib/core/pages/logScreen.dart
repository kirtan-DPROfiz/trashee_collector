import 'package:flutter/material.dart';

class LogsScreen extends StatelessWidget {
  final List<Map<String, String>> _logs = [
    {
      'date': '2023-11-15',
      'time': '09:30 AM',
      'activity': 'Bin #123 collected (Area A) - 12kg',
    },
    {
      'date': '2023-11-15',
      'time': '11:45 AM',
      'activity': 'Notification: Bin #124 is full (Area B)',
    },
    {
      'date': '2023-11-14',
      'time': '03:20 PM',
      'activity': 'Bin #125 collected (Area C) - 8kg',
    },
  ];

  LogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Activity Logs')),
      body: ListView.builder(
        itemCount: _logs.length,
        itemBuilder: (context, index) {
          final log = _logs[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: const Icon(Icons.history),
              title: Text(log['activity']!),
              subtitle: Text('${log['date']} at ${log['time']}'),
            ),
          );
        },
      ),
    );
  }
}
