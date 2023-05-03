import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../constants/app_dimensions.dart';


class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 170,
          height: 170,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppDimensions.defaultSize / 2,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Image.asset(
              'assets/images/Ford_Focus_MK1.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        'CFA 120'.text.bold.make(),
        'In stock: 100 pieces'.text.make(),
      ],
    );
  }
}
