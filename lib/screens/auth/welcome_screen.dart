import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:padi4life/screens/auth/sign_up_screen.dart';
import 'package:padi4life/utils/app_componenet/padded.dart';
import 'package:padi4life/utils/constants.dart';
import 'package:padi4life/utils/navigations.dart';

import '../../utils/app_componenet/padi4life_button.dart';
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
            SizedBox(
              width: autoAdjustWidth(
                282.07,
              ),
              height: autoAdjustHeight(387),
              child: Image.asset(
                'assets/images/Group7.png',
                fit: BoxFit.fill,
              ),
            ),
            Gap(autoAdjustHeight(85)),
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
