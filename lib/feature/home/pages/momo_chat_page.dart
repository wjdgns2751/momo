import 'package:flutter/material.dart';

class MomoChatPage extends StatelessWidget {
  const MomoChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Chat Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.chat_bubble_outlined),
      ),
    );
  }
}
