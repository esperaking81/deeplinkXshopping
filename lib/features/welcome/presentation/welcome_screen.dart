import 'package:deeplink_cookbook/core/constants/app_dimensions.dart';
import 'package:deeplink_cookbook/core/constants/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends HookWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = context.mq.size;

    final currentStep = useState(0);

    final steps = [
      _StepOneView(onClick: () {
        currentStep.value += 1;
      }),
      const _StepTwoView(),
    ];

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: context.colors.primary,
            height: size.height * .55,
            width: size.width,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.shopify,
                  size: 176,
                  color: Colors.white,
                ),
                const SizedBox(height: AppDimensions.defaultSize),
                Text(
                  AppStrings.appName,
                  style: context.headlineLarge?.copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(
                AppDimensions.mediumSize,
              ),
              child: steps[currentStep.value],
            ),
          ),
        ],
      ),
    );
  }
}

final nameProvider = StateProvider<String?>((ref) => null);

class _StepTwoView extends HookConsumerWidget {
  const _StepTwoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var i18n = AppLocalizations.of(context)!;

    final nameController = useTextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(i18n.promptYourName).text.semiBold.xl2.make(),
        const SizedBox(height: AppDimensions.defaultSize),
        Row(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: AppStrings.sampleName,
              ),
            ).expand(),
            const SizedBox(width: AppDimensions.mediumSize),
            SizedBox(
              height: AppDimensions.defaultSize * 3,
              child: FilledButton(
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    return;
                  }

                  ref.read(nameProvider.notifier).state = nameController.text;

                  context.go('/search');
                },
                child: const Icon(Icons.arrow_forward),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _StepOneView extends StatelessWidget {
  final VoidCallback onClick;

  const _StepOneView({
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context)!;
    return Column(
      children: [
        Text(i18n.mainFeatureText).text.semiBold.xl2.make(),
        Text(
          i18n.mainFeatureDescription,
          textAlign: TextAlign.center,
        ).py(AppDimensions.defaultSize),
        ElevatedButton(
          onPressed: onClick,
          child: Text(i18n.proceed),
        ),
      ],
    );
  }
}
