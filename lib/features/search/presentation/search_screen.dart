import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/constants/app_dimensions.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/widgets/product_item.dart';
import '../../../core/widgets/product_section.dart';
import 'search_dialog.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        actions: [
          FilledButton(
            onPressed: () {},
            child: Text(i18n.login),
          ),
          const SizedBox(width: AppDimensions.defaultSize),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const Title().px(AppDimensions.defaultSize),
            const SizedBox(height: AppDimensions.mediumSize),
            SearchBox(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SearchDialog(),
                    fullscreenDialog: true,
                  ),
                );
              },
              onTapPhotoSearch: () {},
            ).px(AppDimensions.defaultSize),
            const SearchOptions().pOnly(
              left: AppDimensions.defaultSize,
              top: AppDimensions.defaultSize,
            ),
            const NewArrivals().pOnly(
              left: AppDimensions.defaultSize,
              top: AppDimensions.defaultSize / 2,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchOptions extends StatelessWidget {
  const SearchOptions({super.key});

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context)!;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SearchOption(
            optionTitle: i18n.shopForProducts,
            optionDescription: i18n.inOurStore,
            icon: Icons.sell_outlined,
            onTap: () {
              context.go('/store');
            },
          ),
          const SizedBox(width: AppDimensions.defaultSize),
          SearchOption(
            optionTitle: i18n.searchPhoto,
            optionDescription: i18n.fromYourLibrary,
            icon: Icons.add_photo_alternate_outlined,
            onTap: () {},
          ),
          const SizedBox(width: AppDimensions.defaultSize),
        ],
      ),
    );
  }
}

class SearchOption extends StatelessWidget {
  final String optionTitle, optionDescription;
  final IconData icon;
  final VoidCallback onTap;
  const SearchOption({
    super.key,
    required this.optionTitle,
    required this.optionDescription,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      style: FilledButton.styleFrom(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.defaultSize,
          horizontal: AppDimensions.defaultSize / 2,
        ),
      ),
      onPressed: onTap,
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: context.colors.surface,
            child: Icon(
              icon,
              color: context.colors.onSurface,
              size: AppDimensions.defaultSize,
            ),
          ),
          const SizedBox(width: AppDimensions.defaultSize / 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(optionTitle)
                  .text
                  .fontWeight(FontWeight.w400)
                  .color(context.colors.onSurface)
                  .make(),
              Text(optionDescription)
                  .text
                  .uppercase
                  .caption(context)
                  .light
                  .make(),
            ],
          ),
        ],
      ),
    );
  }
}

const double searchButtonHeight = 64.0;

class SearchBox extends StatelessWidget {
  final VoidCallback onTap, onTapPhotoSearch;
  const SearchBox({
    super.key,
    required this.onTap,
    required this.onTapPhotoSearch,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: searchButtonHeight,
      child: FilledButton.tonal(
        onPressed: onTap,
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: AppDimensions.defaultSize),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Search', style: context.textTheme.titleLarge),
              const Spacer(),
              IconButton(
                onPressed: onTapPhotoSearch,
                icon: const Icon(Icons.photo_camera_outlined),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  const Title({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppStrings.appName,
        style: Theme.of(context).textTheme.displaySmall?.copyWith(
              color: context.colors.onSurface,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}

class NewArrivals extends StatelessWidget {
  const NewArrivals({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductSection(
      products: List.generate(2, (index) => const ProductItem()),
      title: AppLocalizations.of(context)!.newArrivals,
      onViewAll: () {},
    );
  }
}

