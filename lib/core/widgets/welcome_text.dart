import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../features/welcome/presentation/welcome_screen.dart';

class WelcomeText extends ConsumerWidget {
  const WelcomeText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(nameProvider);

    final titleStyle = context.titleMedium;

    return SizedBox(
      width: context.width * .6,
      child: RichText(
        text: TextSpan(
          text: "${_greeting(name ?? '')}, ",
          style: titleStyle?.copyWith(
            fontWeight: FontWeight.w300,
          ),
          children: [
            TextSpan(
              text: 'What would you like to order today?',
              style: titleStyle?.copyWith(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}

String _greeting(String name) {
  if (name.isEmpty) return 'Hello';
  return 'Hello $name';
}
