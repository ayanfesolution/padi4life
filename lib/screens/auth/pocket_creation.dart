import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/utils/app_componenet/padded.dart';
import 'package:padi4life/utils/app_componenet/padi4life_textfield.dart';
import 'package:padi4life/utils/constants.dart';
import 'package:padi4life/utils/validator.dart';

import '../../utils/app_componenet/padi4life_button.dart';
import '../../utils/navigations.dart';
import 'validate_bvn.dart';

class PocketCreation extends StatefulHookConsumerWidget {
  const PocketCreation({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PocketCreationState();
}

class _PocketCreationState extends ConsumerState<PocketCreation> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var bvnController = useTextEditingController();
    return Scaffold(
      body: Padded(
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Gap(autoAdjustHeight(56)),
              Center(
                child: Text(
                  'Create Pocket',
                  style: kTextStyleCustom(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
              Gap(autoAdjustHeight(135)),
              Center(
                child: Text(
                  'Verify your identity',
                  style: kTextStyleCustom(
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
              Gap(autoAdjustHeight(24)),
              Padi4LifeTextFormField(
                controller: bvnController,
                hintText: 'BVN',
                validator: (value) => Validator.validateBVN(value ?? ''),
              ),
              Gap(autoAdjustHeight(24)),
              Padi4LifeMainButton(
                text: 'Verify',
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    RouteNavigators.route(
                      context,
                      const ValidateBVNScreen(),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
