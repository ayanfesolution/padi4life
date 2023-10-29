import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:padi4life/utils/app_color.dart';

import '../constants.dart';

class Padi4LifeMainButton extends StatelessWidget {
  const Padi4LifeMainButton({
    super.key,
    this.backgroundColor = kPRYCOLOUR,
    this.cornerRadius = 16,
    this.child,
    this.height = 43,
    this.width = double.maxFinite,
    required this.text,
    this.textColor = kWHTCOLOUR,
    this.useCustom = false,
    required this.onTap,
  });
  final bool useCustom;
  final String text;
  final Color textColor;
  final Color backgroundColor;
  final double cornerRadius, height, width;
  final Widget? child;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius:
                BorderRadius.circular(autoAdjustHeight(cornerRadius))),
        height: autoAdjustHeight(height),
        width: autoAdjustWidth(width),
        child: Center(
          child: useCustom
              ? child
              : Text(
                  text,
                  style: kTextStyleCustom(color: textColor),
                ),
        ),
      ),
    );
  }
}

class Padi4LifeIcoButton extends StatelessWidget {
  const Padi4LifeIcoButton({
    super.key,
    this.backGroundColor = kPRYCOLOUR,
    this.height = 62,
    this.width = double.maxFinite,
    this.icon = 'assets/svgs/arrow_forward.svg',
    required this.title,
    required this.onTap,
  });
  final Color backGroundColor;
  final double width, height;
  final String icon, title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: autoAdjustWidth(width),
        height: autoAdjustHeight(height),
        decoration: ShapeDecoration(
          color: backGroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: backGroundColor,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: autoAdjustWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: kTextStyleCustom(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              SvgPicture.asset(icon),
            ],
          ),
        ),
      ),
    );
  }
}

class Padi4LifeBordedIcoButton extends StatelessWidget {
  const Padi4LifeBordedIcoButton({
    super.key,
    this.backGroundColor = kWHTCOLOUR,
    this.boardedColor = kPRYCOLOUR,
    this.height = 62,
    this.textFont = 20,
    this.width = double.maxFinite,
    this.icon = 'assets/svgs/arrow_forward.svg',
    required this.title,
    required this.onTap,
  });
  final Color backGroundColor, boardedColor;
  final double width, height, textFont;
  final String icon, title;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: autoAdjustWidth(width),
        height: autoAdjustHeight(height),
        decoration: ShapeDecoration(
          color: backGroundColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: boardedColor,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: autoAdjustWidth(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: kTextStyleCustom(
                  color: boardedColor,
                  fontSize: textFont,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              SvgPicture.asset(
                icon,
                color: boardedColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
