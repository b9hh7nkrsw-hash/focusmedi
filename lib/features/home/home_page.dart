import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Focusmedi')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Good evening', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 8),
            const Text('Ready to study?', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(height: 24),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Icon(Icons.lock, size: 40),
                    SizedBox(height: 8),
                    Text('FOCUS\nOFF', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text('Start Focus Mode', style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
