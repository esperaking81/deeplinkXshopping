import 'package:deeplink_cookbook/features/orders/presentation/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/constants/app_dimensions.dart';
import '../../../core/widgets/go_back.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const _Header(),
            const SizedBox(height: AppDimensions.defaultSize),
            const CartList().expand(),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class CartList extends StatelessWidget {
  const CartList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, __) => const _CartItem(),
      separatorBuilder: (_, __) => const Divider(),
      itemCount: 3,
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.defaultSize),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Total', style: context.titleMedium),
              Text('F 60,000', style: context.titleMedium),
            ],
          ),
          const SizedBox(
            width: AppDimensions.defaultSize,
          ),
          ElevatedButton(
            onPressed: () {
              showBottomSheet(
                context: context,
                builder: (_) => MaterialPageRoute(
                  builder: (_) => const OrderScreen(),
                ),
              );
            },
            child: const Text('Checkout'),
          ).expand(),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context)!;

    return Container(
      color: context.primaryColor,
      padding: const EdgeInsets.all(AppDimensions.mediumSize),
      child: Row(
        children: [
          const GoBack(),
          const SizedBox(
            width: AppDimensions.defaultSize * 3,
          ),
          Text(
            i18n.myBasket,
            style: context.titleMedium?.copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class _CartItem extends StatelessWidget {
  const _CartItem();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.defaultSize),
      child: Row(
        children: [
          Container(
            height: AppDimensions.defaultSize * 4,
            width: AppDimensions.defaultSize * 4,
            decoration: BoxDecoration(
              color: Colors.amber.shade100,
              borderRadius: BorderRadius.circular(
                AppDimensions.defaultSize / 2,
              ),
            ),
            child: Image.asset(
              'assets/images/food_one.png',
              width: AppDimensions.defaultSize * 3,
              height: AppDimensions.defaultSize * 3,
            ).centered(),
          ),
          const SizedBox(width: AppDimensions.defaultSize),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Quinoa Fruit Salad',
                style:
                    context.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
              const Text('2 packs'),
            ],
          ).expand(),
          Text(
            'F 2,000',
            style: context.titleMedium,
          ),
        ],
      ),
    );
  }
}
