import 'dart:async';

import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:padi4life/screens/onboarding/onboarding_page.dart';
import 'package:padi4life/utils/app_componenet/padded.dart';
import 'package:padi4life/utils/constants.dart';
import 'package:padi4life/utils/navigations.dart';

import '../../utils/app_color.dart';
import 'pocket_creation.dart';

class RegistrationSuccessfulPopUP extends StatefulWidget {
  const RegistrationSuccessfulPopUP({super.key});

  @override
  State<RegistrationSuccessfulPopUP> createState() =>
      _RegistrationSuccessfulPopUPState();
}

class _RegistrationSuccessfulPopUPState
    extends State<RegistrationSuccessfulPopUP> with TickerProviderStateMixin {
  @override
  void initState() {
    initialAction();
    super.initState();
  }

  Future<Timer> initialAction() async {
    return Timer(
      const Duration(seconds: 4),
      () {
        RouteNavigators.routeNoWayHome(context, const PocketCreation());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padded(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: autoAdjustHeight(250),
                width: autoAdjustWidth(250),
                child: LottieBuilder.asset('assets/completedRegistration.json'),
              ),
              Gap(autoAdjustHeight(20)),
              Center(
                child: Text(
                  'Registration Successful',
                  style: kTextStyleCustom(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    //  height: 0.03,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
