import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:padi4life/screens/auth/sign_in_screen.dart';
import 'package:padi4life/utils/constants.dart';
import 'package:padi4life/utils/navigations.dart';
import 'package:padi4life/utils/validator.dart';

import '../../utils/app_componenet/padded.dart';
import '../../utils/app_componenet/padi4life_button.dart';
import '../../utils/app_componenet/padi4life_textfield.dart';

class NewPasswordScreen extends StatefulHookConsumerWidget {
  const NewPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NewPasswordScreenState();
}

class _NewPasswordScreenState extends ConsumerState<NewPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var newPassword = useTextEditingController();
    var confirmedPassword = useTextEditingController();
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
                  'Create New Password',
                  style: kTextStyleCustom(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Gap(
                autoAdjustHeight(50),
              ),
              Center(
                child: SizedBox(
                  height: autoAdjustHeight(150),
                  width: autoAdjustWidth(150),
                  child: LottieBuilder.asset('assets/newpassword.json'),
                ),
              ),
              Gap(autoAdjustHeight(50)),
              Padi4LifeTextFormField(
                controller: newPassword,
                hintText: 'New Password',
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
              Gap(autoAdjustHeight(20)),
              Padi4LifeTextFormField(
                controller: confirmedPassword,
                hintText: 'Confirm Password',
                obscureText: isPasswordVisible.value,
                validator: (data) => Validator.validateConfirmPassword(
                  data ?? '',
                  newPassword.text,
                ),
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
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: autoAdjustHeight(60)),
                    child: Padi4LifeMainButton(
                      text: 'Change Password',
                      width: double.maxFinite,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          RouteNavigators.routeNoWayHome(
                            context,
                            const SignInScreen(),
                          );
                        }
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
