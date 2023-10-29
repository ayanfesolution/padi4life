import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:padi4life/utils/app_componenet/padded.dart';

import '../../utils/app_componenet/padi4life_button.dart';
import '../../utils/app_componenet/padi4life_textfield.dart';
import '../../utils/constants.dart';
import '../../utils/navigations.dart';
import '../../utils/validator.dart';
import 'create_new_password.dart';

class ForgetPasswordScreen extends StatefulHookConsumerWidget {
  const ForgetPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends ConsumerState<ForgetPasswordScreen> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailMail = useTextEditingController();
    return Scaffold(
      body: Padded(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Gap(autoAdjustHeight(56)),
              Center(
                child: Text(
                  'Forget Password',
                  style: kTextStyleCustom(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Gap(autoAdjustHeight(50)),
              Center(
                child: SizedBox(
                  height: autoAdjustHeight(150),
                  width: autoAdjustWidth(150),
                  child: LottieBuilder.asset('assets/forgetpassword.json'),
                ),
              ),
              Gap(autoAdjustHeight(50)),
              Center(
                child: Text(
                  'To reset yor password, enter your email address and a token for verification will be sent to your email',
                  textAlign: TextAlign.center,
                  style: kTextStyleCustom(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Gap(autoAdjustHeight(40)),
              Padi4LifeTextFormField(
                controller: emailMail,
                hintText: 'Email address',
                validator: (data) => Validator.validateEmail(data ?? ''),
              ),
              Gap(autoAdjustHeight(24)),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: EdgeInsets.only(bottom: autoAdjustHeight(60)),
                    child: Padi4LifeMainButton(
                      text: 'Send Token',
                      width: double.maxFinite,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          RouteNavigators.route(
                            context,
                            const NewPasswordScreen(),
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
