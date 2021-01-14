import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RectangularWidget extends StatelessWidget {
  final Text text;
  final bool isOnlyText;
  final double radius;
  final double borderWidth;
  final String imagePath;
  final Color borderColor;
  final Color backgroundColor;
  final Color foregroundColor;
  final Widget placeHolder;
  final Widget errorWidget;

  const RectangularWidget(
      {Key key,
      this.radius,
      this.borderWidth,
      this.imagePath,
      this.backgroundColor,
      this.foregroundColor,
      this.borderColor,
      this.placeHolder,
      this.errorWidget,
      this.text,
      this.isOnlyText})
      : super(key: key);

  Widget getTextWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius / 2),
      child: Container(
          padding: EdgeInsets.all(borderWidth),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius / 2),
              color: backgroundColor),
          child: Center(child: text)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radius * 2,
      width: radius * 2,
      padding: EdgeInsets.all(borderWidth),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius / 2), color: borderColor),
      child: isOnlyText
          ? getTextWidget()
          : imagePath.isEmpty
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(radius / 2),
                  child: Container(
                    color: backgroundColor,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(radius / 2),
                  child: CachedNetworkImage(
                    imageUrl: imagePath,
                    fit: BoxFit.cover,
                    placeholder: (context, url) {
                      return placeHolder;
                    },
                    errorWidget: (context, url, error) {
                      return errorWidget;
                    },
                  ),
                ),
    );
  }
}
