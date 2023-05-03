import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/app_dimensions.dart';

class ProductSection extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAll;
  final List<Widget> products;

  const ProductSection({
    super.key,
    required this.title,
    required this.products,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: context.textTheme.titleLarge
                  ?.copyWith(color: context.colors.onSurface),
            ).expand(),
            if (onViewAll != null)
              IconButton(
                onPressed: onViewAll!,
                icon: const Icon(
                  Icons.arrow_forward_rounded,
                ),
              ),
          ],
        ),
        const SizedBox(height: AppDimensions.defaultSize),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: products,
          ),
        )
      ],
    );
  }
}
