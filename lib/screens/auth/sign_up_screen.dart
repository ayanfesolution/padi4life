import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/utils/constants.dart';

class SignUpScreen extends StatefulHookConsumerWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          )
        ],
      ),
    );
  }
}
