import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mackenzie_academy/core/utils/asset_catalog.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';

class SplachScreen extends StatelessWidget {
  const SplachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: AppColors.blue20,
        body: Stack(children: [
          Positioned.fill(
            child: Image(
                fit: BoxFit.fitWidth,
                image: AssetImage(AssetCatalog.app_logo)),
          )
        ]));
  }
}
