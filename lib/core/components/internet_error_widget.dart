import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:my_self/core/theme/style/color_palatte.dart';

class InternetErrorWidget extends StatelessWidget {
  const InternetErrorWidget({super.key});

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                ColorPalette.of(context).primary,
                ColorPalette.of(context).secoundry,
              ],
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'check_internet_connection_my_dear'.tr(),
                style: Theme.of(context).textTheme.bodyText1?.copyWith(
                      color: ColorPalette.light.white,
                    ),
              )
            ],
          ),
        ),
      );
}
