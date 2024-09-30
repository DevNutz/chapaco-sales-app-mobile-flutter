import 'package:flutter/material.dart';

class DummyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dummy Page'),
      ),
      body: const Center(
        child: Text('Login Successful!'),
      ),
    );
  }
}

