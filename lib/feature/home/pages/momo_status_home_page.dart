import 'package:flutter/material.dart';

class MomoStatusHomePage extends StatelessWidget {
  const MomoStatusHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('상태화면'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
      ),
    );
  }
}
