import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/screens/auth/registration_successful_pop.dart';
import 'package:padi4life/utils/app_componenet/padded.dart';
import 'package:padi4life/utils/app_componenet/padi4life_textfield.dart';
import 'package:padi4life/utils/constants.dart';
import 'package:padi4life/utils/validator.dart';

import '../../utils/app_componenet/padi4life_button.dart';
import '../../utils/navigations.dart';

class SignUpScreen extends StatefulHookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var emailMail = useTextEditingController();
    var password = useTextEditingController();
    var confirmPassword = useTextEditingController();
    var firstName = useTextEditingController();
    var address = useTextEditingController();
    var lastName = useTextEditingController();
    var userName = useTextEditingController();
    var isPasswordVisible = useState(true);
    return Scaffold(
      body: Form(
        key: formKey,
        child: Padded(
          child: ListView(
            children: [
              Gap(autoAdjustHeight(56)),
              Center(
                child: Text(
                  'Create a free account',
                  style: kTextStyleCustom(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Gap(autoAdjustHeight(47)),
              Text(
                'Enter your details',
                style: kTextStyleCustom(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 0,
                ),
              ),
              Gap(autoAdjustHeight(24)),
              Padi4LifeTextFormField(
                controller: firstName,
                hintText: 'First name',
                validator: (data) =>
                    Validator.validateText(data ?? '', 'First Name'),
              ),
              Gap(autoAdjustHeight(24)),
              Padi4LifeTextFormField(
                controller: lastName,
                hintText: 'Last name',
                validator: (data) =>
                    Validator.validateText(data ?? '', 'Last Name'),
              ),
              Gap(autoAdjustHeight(24)),
              Padi4LifeTextFormField(
                controller: emailMail,
                hintText: 'Email',
                validator: (data) => Validator.validateEmail(data ?? ''),
              ),
              Gap(autoAdjustHeight(24)),
              Padi4LifeTextFormField(
                controller: userName,
                hintText: 'Username',
                validator: (data) =>
                    Validator.validateText(data ?? '', 'Username'),
              ),
              Gap(autoAdjustHeight(24)),
              Padi4LifeTextFormField(
                controller: address,
                hintText: 'Address',
                validator: (data) =>
                    Validator.validateText(data ?? '', 'Address'),
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
              Padi4LifeTextFormField(
                controller: confirmPassword,
                hintText: 'Repeat Password',
                obscureText: isPasswordVisible.value,
                validator: (data) => Validator.validateConfirmPassword(
                    data ?? '', password.text),
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
              Padi4LifeMainButton(
                text: 'Sign Up',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    RouteNavigators.route(
                      context,
                      const RegistrationSuccessfulPopUP(),
                    );
                  }
                },
              ),
              Gap(autoAdjustHeight(30)),
              Row(
                children: [
                  Text(
                    'Have an account already? ',
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
                      'Sign In',
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
              Gap(autoAdjustHeight(30)),
            ],
          ),
        ),
      ),
    );
  }
}
