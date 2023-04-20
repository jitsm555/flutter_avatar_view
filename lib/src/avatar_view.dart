import 'package:avatar_view/src/circular_widget.dart';
import 'package:avatar_view/src/rectangular_widget.dart';
import 'package:flutter/material.dart';

class AvatarView extends StatelessWidget {
  final AvatarType avatarType;
  final bool isOnlyText;
  final double radius;

  final double borderWidth;

  final Color? borderColor;

  final Color? backgroundColor;

  final Color? foregroundColor;

  final String imagePath;

  final Text? text;

  final GestureTapCallback? onTap;

  final Widget? placeHolder;

  final Widget? errorWidget;

  final Map<String, String>? headers;

  const AvatarView({
    Key? key,
    this.avatarType = AvatarType.CIRCLE,
    this.isOnlyText = false,
    this.radius = 50,
    this.borderWidth = 0,
    this.borderColor,
    this.backgroundColor,
    this.foregroundColor,
    this.imagePath = "",
    this.text,
    this.onTap,
    this.placeHolder,
    this.errorWidget,
    this.headers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: avatarType == AvatarType.CIRCLE
          ? CircularWidget(
              backgroundColor: backgroundColor,
              borderColor: borderColor,
              borderWidth: borderWidth,
              errorWidget: errorWidget,
              placeHolder: placeHolder,
              imagePath: imagePath,
              radius: radius,
              foregroundColor: foregroundColor,
              text: text,
              isOnlyText: isOnlyText,
            )
          : RectangularWidget(
              backgroundColor: backgroundColor,
              borderColor: borderColor,
              borderWidth: borderWidth,
              errorWidget: errorWidget,
              placeHolder: placeHolder,
              imagePath: imagePath,
              radius: radius,
              foregroundColor: foregroundColor,
              text: text,
              isOnlyText: isOnlyText,
            ),
    );
  }
}

enum AvatarType {
  CIRCLE,
  RECTANGLE,
}
