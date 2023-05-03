import 'package:deeplink_cookbook/core/widgets/product_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:deeplink_cookbook/core/constants/app_dimensions.dart';

class ProductDetailScreen extends StatelessWidget {
  final String? id;
  const ProductDetailScreen({super.key, this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.primary,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppDimensions.mediumSize),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      context.pop();
                    },
                    label: const Text('Go back'),
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const SizedBox(height: AppDimensions.defaultSize * 2),
                  Image.asset(
                    'assets/images/food_one.png',
                    fit: BoxFit.cover,
                  ).centered(),
                ],
              ),
            ),
            const SizedBox(height: AppDimensions.mediumSize),
            RoundedContainer(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Header(),
                    Divider(),
                    Main(),
                    Divider(),
                    Footer(),
                  ],
                ),
              ),
            ).expand(),
          ],
        ),
      ),
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
          CircleContainer(
            icon: Icons.favorite_border,
            iconColor: context.primaryColor,
            borderColor: context.primaryColor,
            bgColor: context.colors.primaryContainer,
            size: AppDimensions.defaultSize * 5,
          ),
          // FilledButton.tonal(
          //   onPressed: () {},
          //   child: const Text('Add to cart'),
          // ).expand(),
          const SizedBox(width: AppDimensions.defaultSize),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Order'),
          ).expand(),
        ],
      ),
    );
  }
}

class UnderlineTitle extends StatelessWidget {
  final String title;
  const UnderlineTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: context.titleLarge?.copyWith(
        decoration: TextDecoration.underline,
        decorationThickness: 3.0,
        decorationColor: context.primaryColor,
      ),
    ).text.make();
  }
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.defaultSize),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          UnderlineTitle(title: 'Product details :'),
          SizedBox(height: AppDimensions.defaultSize),
          Text(productDetails),
          SizedBox(height: AppDimensions.defaultSize),
          YouMayAlsoLike(),
        ],
      ),
    );
  }
}

class YouMayAlsoLike extends StatelessWidget {
  const YouMayAlsoLike({super.key});

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context)!;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          i18n.youMayAlsoLike,
          style: context.titleLarge,
        ),
        const SizedBox(height: AppDimensions.defaultSize),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: const [ProductItem()],
          ),
        ),
      ],
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.mediumSize),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Quino Fruit Salad',
                style: context.titleLarge,
              ),
              FilledButton.tonal(
                onPressed: () {},
                child: const Text('Order now'),
              ),
            ],
          ),
          const SizedBox(height: AppDimensions.mediumSize),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const _QuantitySelector(),
              Text(
                'F 2,000',
                style:
                    context.titleMedium?.copyWith(color: context.primaryColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CircleContainer extends StatelessWidget {
  final Color borderColor;
  final Color iconColor;
  final Color bgColor;
  final IconData icon;
  final double size;

  const CircleContainer({
    super.key,
    required this.iconColor,
    required this.borderColor,
    required this.icon,
    required this.bgColor,
    this.size = AppDimensions.defaultSize,
  });

  @override
  Widget build(BuildContext context) {
    var size = AppDimensions.defaultSize * 2;

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: bgColor,
        border: Border.all(color: borderColor),
      ),
      child: Icon(icon, color: iconColor),
    );
  }
}

class _QuantitySelector extends StatelessWidget {
  const _QuantitySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleContainer(
          iconColor: Colors.black,
          borderColor: Colors.black,
          icon: Icons.remove,
          bgColor: Colors.white,
        ),
        const Text(
          '1',
        ).text.size(24).make().px(AppDimensions.mediumSize),
        CircleContainer(
          iconColor: context.primaryColor,
          borderColor: context.colors.primaryContainer,
          icon: Icons.add,
          bgColor: context.colors.primaryContainer,
        ),
      ],
    );
  }
}

class RoundedContainer extends StatelessWidget {
  final Widget child;
  const RoundedContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimensions.mediumSize),
          topRight: Radius.circular(AppDimensions.mediumSize),
        ),
      ),
      child: child,
    );
  }
}

const productDetails =
    'Lorem ipsum dolor sit amet, officia excepteur ex fugiat reprehenderit enim labore culpa sint ad nisi Lorem pariatur mollit ex esse exercitation amet. Nisi anim cupidatat excepteur officia. Reprehenderit nostrud nostrud ipsum Lorem est aliquip amet voluptate voluptate dolor minim nulla est proident. Nostrud officia pariatur ut officia. Sit irure elit esse ea nulla sunt ex occaecat reprehenderit commodo officia dolor Lorem duis laboris cupidatat officia voluptate. Culpa proident adipisicing id nulla nisi laboris ex in Lorem sunt duis officia eiusmod. Aliqua reprehenderit commodo ex non excepteur duis sunt velit enim. Voluptate laboris sint cupidatat ullamco ut ea consectetur et est culpa et culpa duis.';
