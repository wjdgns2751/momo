import 'package:flutter/material.dart';

class MomoCallPage extends StatelessWidget {
  const MomoCallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('call Page'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.call_end),
      ),
    );
  }
}
