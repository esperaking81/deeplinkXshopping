import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../core/constants/app_dimensions.dart';

class SearchDialog extends StatelessWidget {
  const SearchDialog({super.key});

  @override
  Widget build(BuildContext context) {
    var i18n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: SizedBox(
          height: context.mq.size.height,
          width: context.mq.size.width,
          child: Column(
            children: [
              ListTile(
                dense: true,
                leading: const Icon(Icons.shopping_bag_outlined),
                title: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: i18n.search,
                  ),
                ),
                trailing: const Icon(Icons.photo_camera_outlined),
              ),
              const Divider().wFull(context).px(AppDimensions.defaultSize),
              const ListTile(
                leading: Icon(
                  Icons.timer_rounded,
                ),
                title: Text('clean architecture'),
                trailing: Icon(Icons.north_west_rounded),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
