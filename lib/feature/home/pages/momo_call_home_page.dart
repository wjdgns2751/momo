import 'package:flutter/material.dart';

class MomoCallHomePage extends StatelessWidget {
  const MomoCallHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('전화화면'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.call_end),
      ),
    );
  }
}
