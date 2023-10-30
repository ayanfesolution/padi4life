import 'dart:async';
import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:padi4life/screens/auth/sign_in_screen.dart';
import 'package:padi4life/utils/constants.dart';
import 'package:padi4life/utils/helper.dart';
import 'package:padi4life/utils/navigations.dart';

import '../../utils/app_color.dart';
import 'onboarding_page.dart';

class SplashScreen extends StatefulHookWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const String id = 'splash.screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  @override
  void initState() {
    initialAction();
    super.initState();
  }

  Future<Timer> initialAction() async {
    bool isItNotFirstTimeUser = await Helper.checkIfItsFirstLaunch();
    return Timer(
      const Duration(seconds: 4),
      () {
        RouteNavigators.routeReplace(
          context,
          isItNotFirstTimeUser
              ? const SignInScreen()
              : const OnboardingScreen(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final AnimationController controller = useAnimationController(
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    late final Animation<double> animation = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOutBack,
    );
    SizeConfig().init(context, 852, 393);
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: autoAdjustHeight(120),
                width: autoAdjustWidth(120),
                child: Image.asset(
                  'assets/images/mainlogo.png',
                ),
              ),
              Gap(autoAdjustHeight(41)),
              Text(
                'Padi4Life',
                style: kTextStyleCustom(
                  color: kPRYCOLOUR,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                  //  height: 0.03,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
