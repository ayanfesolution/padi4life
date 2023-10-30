import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/utils/app_componenet/padded.dart';
import 'package:padi4life/utils/app_componenet/padi4life_textfield.dart';
import 'package:padi4life/utils/constants.dart';
import 'package:padi4life/utils/helper.dart';
import 'package:padi4life/utils/validator.dart';

import '../../providers/users_provider.dart';
import '../../utils/app_componenet/padi4life_button.dart';
import '../../utils/loader_copy.dart';
import '../../utils/navigations.dart';
import '../dashboard/bottom_nav_bar.dart';
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
    var pinController = useTextEditingController();
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
                keyboardType: TextInputType.number,
                validator: (value) => Validator.validateBVN(value ?? ''),
              ),
              Gap(autoAdjustHeight(24)),
              Padi4LifeTextFormField(
                controller: pinController,
                hintText: '4 Digit PIN',
                keyboardType: TextInputType.number,
                validator: (value) => Validator.validatePIN(value ?? ''),
              ),
              Gap(autoAdjustHeight(24)),
              Padi4LifeMainButton(
                text: 'Verify',
                onTap: () async {
                  String userName = await Helper.getAStoredString(
                    key: ConstantKeys.kUsername,
                  );
                  if (formKey.currentState!.validate()) {
                    CXLoader.show(context);
                    bool results =
                        await ref.read(authProvider.notifier).createWallet(
                              pin: pinController.text,
                              bvn: bvnController.text,
                              userName: userName,
                            );
                    CXLoader.hide();
                    // if (results) {
                    if (mounted) {
                      RouteNavigators.routeNoWayHome(
                        context,
                        const BottomNavBar(),
                      );
                      //}
                    }
                    // RouteNavigators.route(
                    //   context,
                    //   const ValidateBVNScreen(),
                    // );
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
