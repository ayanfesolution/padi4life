import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/screens/auth/sign_up_screen.dart';
import 'package:padi4life/utils/app_color.dart';
import 'package:padi4life/utils/app_componenet/corner_padded_widget.dart';
import 'package:padi4life/utils/app_componenet/padded.dart';
import 'package:padi4life/utils/app_componenet/padi4life_textfield.dart';
import 'package:padi4life/utils/navigations.dart';
import 'package:padi4life/utils/validator.dart';

import '../../utils/app_componenet/padi4life_button.dart';
import '../../utils/constants.dart';
import '../dashboard/bottom_nav_bar.dart';
import 'forget_password_screen.dart';

class SignInScreen extends StatefulHookConsumerWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailMail = useTextEditingController();
    var password = useTextEditingController();
    var rememberMe = useState(false);
    var isPasswordVisible = useState(true);
    return Scaffold(
      body: Padded(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Gap(autoAdjustHeight(56)),
              Center(
                child: Text(
                  'Welcome back',
                  style: kTextStyleCustom(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Gap(autoAdjustHeight(135)),
              Image.asset('assets/images/personIcon.png'),
              Gap(autoAdjustHeight(40)),
              Padi4LifeTextFormField(
                controller: emailMail,
                hintText: 'Email address',
                validator: (data) => Validator.validateEmail(data ?? ''),
              ),
              Gap(autoAdjustHeight(24)),
              Padi4LifeTextFormField(
                controller: password,
                hintText: 'Password',
                obscureText: isPasswordVisible.value,
                validator: (data) => Validator.validatePassword(data ?? ''),
                suffixIcon: Padding(
                  padding: EdgeInsets.all(autoAdjustHeight(12)),
                  child: InkWell(
                    onTap: () {
                      isPasswordVisible.value = !isPasswordVisible.value;
                    },
                    child: SvgPicture.asset(
                      isPasswordVisible.value
                          ? 'assets/svgs/eye-off.svg'
                          : 'assets/svgs/eyevisible.svg',
                    ),
                  ),
                ),
              ),
              Gap(autoAdjustHeight(24)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox.adaptive(
                        activeColor: kPRYCOLOUR,
                        value: rememberMe.value,
                        side: const BorderSide(color: kPRYCOLOUR),
                        onChanged: (value) {
                          rememberMe.value = value ?? false;
                        },
                      ),
                      Text(
                        'Remember me  ',
                        style: kTextStyleCustom(
                          color: Colors.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      )
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      RouteNavigators.route(
                          context, const ForgetPasswordScreen());
                    },
                    child: Text(
                      'Forgot Password?',
                      style: kTextStyleCustom(
                        color: const Color(0xFF412D95),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  )
                ],
              ),
              Gap(autoAdjustHeight(40)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padi4LifeMainButton(
                    text: 'Sign in',
                    width: 238,
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        RouteNavigators.routeNoWayHome(
                          context,
                          const BottomNavBar(),
                        );
                      }
                    },
                  ),
                  CornerPaddedWidget(
                      color: const Color(0xFFD9D9D9),
                      padding: 12,
                      child: SvgPicture.asset(
                          'assets/svgs/ic_baseline-fingerprint.svg'))
                ],
              ),
              Gap(autoAdjustHeight(40)),
              Row(
                children: [
                  Text(
                    'Yet to register? ',
                    style: kTextStyleCustom(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      RouteNavigators.route(context, const SignUpScreen());
                    },
                    child: Text(
                      'Sign up',
                      style: kTextStyleCustom(
                        color: const Color(0xFF412D95),
                        fontSize: 13,
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
