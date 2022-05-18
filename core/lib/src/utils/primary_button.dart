import 'package:core/src/utils/color_collection.dart';
import 'package:core/src/utils/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.title,
    this.titleSize,
    this.onTap,
    this.textColor = Colors.white,
    this.isLoading = false,
    this.disableColor = ColorsCollection.cUnselectedLoad,
    this.color,
    this.cornerRadius = 15,
    this.borderRadius,
    this.trailingIcon,
    this.trailingIconColor,
    this.height,
  }) : super(key: key);

  final String? title;
  final double? titleSize;
  final GestureTapCallback? onTap;
  final Color? color;
  final Color textColor;
  final bool isLoading;
  final Color disableColor;
  final double cornerRadius;
  final BorderRadius? borderRadius;
  final String? trailingIcon;
  final Color? trailingIconColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        color: color == null ? ColorsCollection.cRipple10 : color,
        shape: RoundedRectangleBorder(
            borderRadius: borderRadius ?? BorderRadius.circular(cornerRadius)),
        disabledColor: disableColor,
        elevation: 0,
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        onPressed: onTap,
        child: Container(
            height: height ?? 45,
            child: !isLoading
                ? Stack(children: [
                    Align(
                        alignment: Alignment.center,
                        child: Text(title!,
                            textAlign: TextAlign.center,
                            style: subtitle1().copyWith(color: textColor))),
                    if (trailingIcon != null)
                      Align(
                          alignment: Alignment.centerRight,
                          child: SvgPicture.asset(trailingIcon!,
                              color: trailingIconColor))
                  ])
                : Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                        height: 20,
                        width: 20,
                        child: Center(
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white))))
                  ])));
  }
}
