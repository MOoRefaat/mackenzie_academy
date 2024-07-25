import 'package:flutter/material.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';


class CustomCard extends StatelessWidget {
//Card label attributes
  final String? cardLabelText;
  final TextStyle? cardLabelStyle;
  final IconData? cardIcon;
  final double? iconSize;
  final Color? iconColor;

//Button container attributes
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final VoidCallback? onPress;
  final Color? backgroundColor;


  const CustomCard({super.key,
    this.cardLabelText,
    this.onPress,
    this.backgroundColor = AppColors.gold30,
    this.cardLabelStyle,
    this.width,
    this.height,
    this.borderRadius,
    buttonImageLocation,
    this.borderColor,
    this.borderWidth, this.cardIcon, this.iconSize, this.iconColor,
  });


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(cardIcon, size: iconSize ?? 40,
                  color: iconColor ?? AppColors.blue20),
              SizedBox(height: 10),
              Text(cardLabelText ?? "",
                  style: cardLabelStyle ?? TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}


