import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String email;

  const ProfileScreen({Key? key, required this.email}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Профиль'),
        backgroundColor: const Color(0xFF4facfe),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Ваш профиль',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.email, color: Colors.grey),
                const SizedBox(width: 8),
                Text(email, style: const TextStyle(fontSize: 16)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}