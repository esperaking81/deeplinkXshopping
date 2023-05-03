import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class GoBack extends StatelessWidget {
  const GoBack({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        context.pop();
      },
      label: const Text('Go back'),
      icon: const Icon(Icons.arrow_back),
    );
  }
}
