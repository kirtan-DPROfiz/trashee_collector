import 'package:flutter/material.dart';

class CollectionScreen extends StatelessWidget {
  final String binId;
  final String status;

  const CollectionScreen({
    super.key,
    required this.binId,
    required this.status,
    required String area,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Record Collection')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Bin #$binId is $status',
              style: const TextStyle(fontSize: 18),
            ),
            // Vehicle status message
            const Text(
              'Vehicle No: XX-XX-XXXX is collecting waste from Bin #123 in Area X',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Bin details
            Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const Text('Bin #123',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('Status:'),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text('Full (95%)',
                              style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Last Collected:'),
                        Text('2 days ago'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Weight input
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Waste Collected (kg)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 20),

            // Submit button
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Collection recorded successfully!')),
                );
                Navigator.pop(context); // Go back to map
              },
              child: const Text('Submit Collection'),
            ),
          ],
        ),
      ),
    );
  }
}
