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
            child: const Align(
              alignment: Alignment.center,
              child: Icon(
                Icons.shopify,
                size: 176,
              ),
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
        TextField(
          controller: nameController,
          decoration: InputDecoration(
            hintText: AppStrings.sampleName,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32),
            ),
          ),
        ),
        const SizedBox(height: AppDimensions.mediumSize),
        SizedBox(
          height: AppDimensions.defaultSize * 3,
          width: double.infinity,
          child: FilledButton(
            onPressed: () {
              if (nameController.text.isEmpty) {
                return;
              }

              ref.read(nameProvider.notifier).state = nameController.text;

              context.go('/search');
            },
            child: Text(i18n.proceed),
          ),
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
