import 'package:deeplink_cookbook/features/cart/presentation/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/widgets/product_item.dart';
import '../../../core/widgets/product_section.dart';
import '../../../core/constants/app_dimensions.dart';
import '../../../core/widgets/welcome_text.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        child: StoreDrawerContent(),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(AppDimensions.defaultSize - 6),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.white, Colors.grey.shade200],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const _MyAppBar(),
              Padding(
                padding: const EdgeInsets.all(AppDimensions.defaultSize - 6),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    WelcomeText(),
                    SizedBox(
                      height: AppDimensions.defaultSize,
                    ),
                    SearchBar(),
                    SizedBox(
                      height: AppDimensions.defaultSize,
                    ),
                    StoreSection(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StoreSection extends StatelessWidget {
  const StoreSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recommended Combo',
          style: context.titleMedium
              ?.copyWith(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: AppDimensions.mediumSize),
        Row(
          children: [
            const StoreItem().expand(),
            AppDimensions.defaultSize.widthBox,
            const StoreItem().expand(),
          ],
        ),
      ],
    );
  }
}

class _MyAppBar extends StatelessWidget {
  const _MyAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        IconButton(
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const CartScreen(),
                fullscreenDialog: true,
              ),
            );
          },
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextField(
          decoration: InputDecoration(
            filled: true,
            focusColor: Colors.grey.shade100,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                AppDimensions.defaultSize,
              ),
            ),
            prefixIcon: const Icon(Icons.search),
            hintText: 'Search for a product',
          ),
        ).expand(),
        const SizedBox(
          width: AppDimensions.defaultSize,
        ),
        // SvgPicture.asset(
        //   'assets/icons/filter_icon.svg',
        // ),
      ],
    );
  }
}

class TopRanking extends StatelessWidget {
  const TopRanking({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductSection(
      products: List.generate(3, (index) => const ProductItem()),
      title: AppLocalizations.of(context)!.topRankings,
    );
  }
}

class StoreDrawerContent extends StatelessWidget {
  const StoreDrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context)!;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Scaffold.of(context).closeDrawer();
                  },
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
            CategoryItem(
              title: i18n.fashion,
              icon: Icons.grid_view_rounded,
            ),
            CategoryItem(
              title: i18n.computing,
              icon: Icons.computer_rounded,
            ),
            CategoryItem(
              title: i18n.phones,
              icon: Icons.phone_rounded,
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  final String title;
  final IconData icon;

  const CategoryItem({
    super.key,
    required this.title,
    required this.icon,
  });

  String get newTitle {
    if (!title.contains(' ')) return title;

    var stringBuffer = StringBuffer();
    var parts = title.split(' ');

    stringBuffer.writeln(parts.first);
    parts.remove(parts.first);

    stringBuffer.write(parts.join(' '));

    return stringBuffer.toString();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
    );
  }
}

class StoreItem extends StatelessWidget {
  const StoreItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/store/1');
      },
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(AppDimensions.defaultSize),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: context.primaryColor,
                  ).onInkTap(() {}),
                ],
              ),
              Image.asset('assets/images/food_one.png'),
              const SizedBox(
                height: AppDimensions.defaultSize - 6,
              ),
              FittedBox(
                child: Text(
                  'Honey line combo',
                  style: context.titleMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                height: AppDimensions.defaultSize - 6,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'F 2,000',
                    style: context.titleSmall
                        ?.copyWith(color: context.colors.primary),
                  ),
                  Container(
                    height: AppDimensions.mediumSize,
                    width: AppDimensions.mediumSize,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: context.colors.primaryContainer,
                    ),
                    child: Icon(
                      Icons.add,
                      color: context.colors.primary,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
