import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:padi4life/screens/auth/sign_up_screen.dart';
import 'package:padi4life/utils/app_color.dart';
import 'package:padi4life/utils/app_componenet/padded.dart';
import 'package:padi4life/utils/constants.dart';
import 'package:padi4life/utils/navigations.dart';

import 'sign_in_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padded(
        child: Column(
          children: [
            Gap(autoAdjustHeight(56)),
            Center(
              child: Text(
                'Padi for every situation',
                style: kTextStyleCustom(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            Gap(autoAdjustHeight(30)),
            Padi4LifeIcoButton(
              onTap: () {
                RouteNavigators.route(
                  context,
                  const SignUpScreen(),
                );
              },
              title: 'Sign Up',
            ),
            Gap(autoAdjustHeight(16)),
            Padi4LifeBordedIcoButton(
              onTap: () {
                RouteNavigators.route(
                  context,
                  const SignInScreen(),
                );
              },
              title: 'Sign In',
            ),
          ],
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
    this.width = double.maxFinite,
    this.icon = 'assets/svgs/arrow_forward.svg',
    required this.title,
    required this.onTap,
  });
  final Color backGroundColor, boardedColor;
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
                  fontSize: 20,
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
