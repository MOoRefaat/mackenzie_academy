import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mackenzie_academy/core/utils/theme/color.dart';


class CustomButton extends StatelessWidget {
  //Button label attributes
  final String? buttonLabelText;
  final TextStyle? buttonLabelStyle;

  //Button container attributes
  final double? width;
  final double? height;
  final double? borderRadius;
  final Color? borderColor;
  final double? borderWidth;
  final VoidCallback? onPress;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;

  //Button image attributes

  //Can take PNG and SVG
  final String? imagePath;
  final ButtonImageLocation? buttonImagePosition;
  final double? imageHeight;
  final double? imageWidth;
  final Color? svgImageColor;
  final bool? isEnabled;
  final int? numberOfMaxLines;
  final bool isCompletelyCircularButton;

  const CustomButton(
      {super.key,
        this.buttonLabelText,
        this.onPress,
        this.backgroundColor = AppColors.gold30,
        this.disabledBackgroundColor,
        this.buttonLabelStyle,
        this.width,
        this.height,
        this.borderRadius,
        buttonImageLocation,
        this.borderColor,
        this.imagePath,
        this.imageHeight,
        this.imageWidth,
        this.isEnabled,
        this.borderWidth,
        this.svgImageColor,
        this.numberOfMaxLines,
        this.isCompletelyCircularButton = false})
      : buttonImagePosition = buttonImageLocation ?? ButtonImageLocation.none;

  get buttonImageLocation => buttonImagePosition;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(
              Size(width ?? double.infinity, height ?? 0)),
          backgroundColor: (isEnabled ?? true)
              ? MaterialStateProperty.all<Color>(
              backgroundColor?? AppColors.gold30)
              : MaterialStateProperty.all<Color>(disabledBackgroundColor ??
              defaultDisabledButtonBackgroundColor),
          elevation: MaterialStateProperty.all<double>(0),
          shape: isCompletelyCircularButton
              ? MaterialStateProperty.all<CircleBorder>(CircleBorder(
              side: BorderSide(
                  width: borderWidth ?? 1.0,
                  color: borderColor ?? defaultButtonBorderColor)))
              : MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                  borderRadius ?? defaultButtonBorderRadius),
              side: BorderSide(
                  width: borderWidth ?? 1.0,
                  color: borderColor ?? defaultButtonBorderColor)))),
      onPressed: (isEnabled ?? true) ? onPress : null,
      child: buttonImagePosition == ButtonImageLocation.top ||
          buttonImagePosition == ButtonImageLocation.none
          ? Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: getChildren(),
        ),
      )
          : Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.center,
        children: getChildren(),
      ),
    );
  }

  List<Widget> getChildren() {
    List<Widget> widgetList = [];

    if (imagePath != null) {
      widgetList.add(imagePath!.split('.').last != "svg"
          ? Image(
          height: imageHeight ?? defaultButtonImageHeight,
          width: imageWidth ?? defaultButtonImageWidth,
          image: AssetImage("assets/images/$imagePath"))
          : SvgPicture.asset(
        "assets/images/$imagePath",
        color: svgImageColor,
        height: imageHeight ?? defaultButtonImageHeight,
        width: imageWidth ?? defaultButtonImageWidth,
      ));
    }

    if (buttonLabelText != null) {
      widgetList.add(Text(
        buttonLabelText ?? '',
        style: buttonLabelDefaultStyle?.merge(buttonLabelStyle),
        overflow: numberOfMaxLines != null ? TextOverflow.ellipsis : null,
        maxLines: numberOfMaxLines,
      ));
    }

    if (imagePath != null &&
        buttonLabelText != null &&
        buttonImagePosition == ButtonImageLocation.right) {
      return List.from(widgetList.reversed);
    }

    return widgetList;
  }
}

enum ButtonImageLocation { none, top, right, left }

//Button container default style attributes
Color defaultButtonBackgroundColor = AppColors.transparent;
Color defaultDisabledButtonBackgroundColor = AppColors.gray00;
const defaultButtonBorderRadius = 5.0;
Color defaultButtonBorderColor = AppColors.transparent;

//Button label default style attributes
const buttonLabelDefaultFontSize = 16.0;
TextStyle? buttonLabelDefaultStyle = TextStyle(fontWeight: FontWeight.bold);
    //TextStyleCatalog.bodySemiBold;

//Button image default styles and values
const defaultButtonImageHeight = 25.0;
const defaultButtonImageWidth = 25.0;