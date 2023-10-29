import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/utils/app_componenet/padded.dart';
import 'package:padi4life/utils/app_componenet/padi4life_button.dart';
import 'package:padi4life/utils/constants.dart';

import '../../../onboarding/onboarding_page.dart';

class WalletSection extends StatefulHookConsumerWidget {
  const WalletSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WalletSectionState();
}

class _WalletSectionState extends ConsumerState<WalletSection> {
  final PageController pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    var currentIndex = useState(0);

    return Container(
      height: 330,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/images/backgroung.png',
          ),
          fit: BoxFit.fitWidth,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      child: Padded(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu),
                Text(
                  'Welcome, Damaiu Dalu',
                  style: kTextStyleCustom(fontWeight: FontWeight.w300),
                ),
                const CircleAvatar(
                  radius: 20,
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: PageView.builder(
                controller: pageController,
                onPageChanged: (newValue) {
                  currentIndex.value = newValue;
                },
                itemCount: walletTypeList.length,
                itemBuilder: (context, index) {
                  WalletTypeModel page = walletTypeList[index];
                  return WalletType(
                      walletTitle: page.walletTitle,
                      amount: page.amount,
                      buttonText1: page.buttonText1,
                      buttonText2: page.buttonText2);
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallCircleWidget(
                  isITActive: currentIndex.value == 0,
                ),
                Gap(autoAdjustWidth(8)),
                SmallCircleWidget(
                  isITActive: currentIndex.value == 1,
                ),
                Gap(autoAdjustWidth(8)),
                SmallCircleWidget(
                  isITActive: currentIndex.value == 2,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}

class WalletType extends StatefulHookConsumerWidget {
  const WalletType(
      {super.key,
      required this.walletTitle,
      required this.amount,
      required this.buttonText1,
      required this.buttonText2});

  final String walletTitle;
  final String amount;
  final String buttonText1;
  final String buttonText2;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WalletTypeState();
}

class _WalletTypeState extends ConsumerState<WalletType> {
  @override
  Widget build(BuildContext context) {
    var isWalletVisible = useState(true);
    return Column(
      children: [
        Text(
          widget.walletTitle,
          style: kTextStyleCustom(fontWeight: FontWeight.w400),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              !isWalletVisible.value ? widget.amount : '********',
              style:
                  kTextStyleCustom(fontWeight: FontWeight.w600, fontSize: 30),
            ),
            const SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {
                isWalletVisible.value = !isWalletVisible.value;
              },
              child: SvgPicture.asset(
                !isWalletVisible.value
                    ? 'assets/svgs/eye-off.svg'
                    : 'assets/svgs/eyevisible.svg',
                fit: BoxFit.contain,
                color: Colors.black,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padi4LifeMainButton(
              text: widget.buttonText1,
              onTap: () {},
              width: 115,
              cornerRadius: 10,
              height: 35,
            ),
            const SizedBox(
              width: 20,
            ),
            Padi4LifeMainButton(
              text: widget.buttonText2,
              onTap: () {},
              width: 115,
              cornerRadius: 10,
              height: 35,
            ),
          ],
        ),
      ],
    );
  }
}

List<WalletTypeModel> walletTypeList = [
  WalletTypeModel(
      walletTitle: 'Your Personal Pocket',
      amount: '₦ 895,456.56',
      buttonText1: 'Add Cash',
      buttonText2: 'Send Money'),
  WalletTypeModel(
      walletTitle: 'Your Padicoin Pocket',
      amount: '56,065 coins',
      buttonText1: 'Earn more',
      buttonText2: 'Convert coins'),
  WalletTypeModel(
      walletTitle: 'Outstanding Loan',
      amount: '₦ 95,456.56',
      buttonText1: 'Check Status',
      buttonText2: 'Payoff')
];

class WalletTypeModel {
  final String walletTitle;
  final String amount;
  final String buttonText1;
  final String buttonText2;

  WalletTypeModel(
      {required this.walletTitle,
      required this.amount,
      required this.buttonText1,
      required this.buttonText2});
}
