import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/screens/auth/welcome_screen.dart';
import 'package:padi4life/utils/app_color.dart';
import 'package:padi4life/utils/app_componenet/padded.dart';
import 'package:padi4life/utils/constants.dart';
import 'package:padi4life/utils/navigations.dart';

import '../../utils/app_componenet/corner_padded_widget.dart';

class OnboardingScreen extends StatefulHookConsumerWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    var currentIndex = useState(0);
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            'assets/images/backgroung.png',
          ),
          fit: BoxFit.fill,
        )),
        child: Padded(
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  controller: pageController,
                  onPageChanged: (newValue) {
                    currentIndex.value = newValue;
                  },
                  itemCount: onBoardingList.length,
                  itemBuilder: (context, index) {
                    OnboardingModel page = onBoardingList[index];
                    return OnboardingSingleSection(
                      title: page.title,
                      subTitle: page.subTitle,
                      imagePath: page.imagePath,
                    );
                  },
                ),
              ),

              Padding(
                padding: EdgeInsets.only(bottom: autoAdjustHeight(59)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
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
                        Gap(autoAdjustWidth(8)),
                        SmallCircleWidget(
                          isITActive: currentIndex.value == 3,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        if (pageController.page != 3) {
                          currentIndex.value =
                              (pageController.page ?? 0).toInt() + 1;
                          pageController.nextPage(
                              duration: const Duration(seconds: 1),
                              curve: Curves.bounceOut);
                        } else {
                          RouteNavigators.routeNoWayHome(
                            context,
                            const WelcomeScreen(),
                          );
                        }
                      },
                      child: CornerPaddedWidget(
                        child:
                            SvgPicture.asset('assets/svgs/arrow_forward.svg'),
                      ),
                    ),
                  ],
                ),
              ),
              // Gap(autoAdjustHeight(35)),
            ],
          ),
        ),
      ),
    );
  }
}

class OnboardingSingleSection extends StatelessWidget {
  const OnboardingSingleSection({
    super.key,
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });
  final String title, subTitle, imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(autoAdjustHeight(124)),
        Container(
          width: autoAdjustWidth(356),
          height: autoAdjustHeight(356),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
        Gap(autoAdjustHeight(35)),
        Text(
          title,
          style: kTextStyleCustom(
            fontSize: 40,
            fontWeight: FontWeight.w400,
          ),
        ),
        Gap(autoAdjustHeight(8)),
        Text(
          subTitle,
          style: kTextStyleCustom(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class SmallCircleWidget extends StatelessWidget {
  const SmallCircleWidget({
    super.key,
    required this.isITActive,
  });
  final bool isITActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: autoAdjustWidth(8),
      height: autoAdjustHeight(8),
      decoration: ShapeDecoration(
        color: isITActive ? kPRYCOLOUR : kINACTIVECOLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }
}

List<OnboardingModel> onBoardingList = [
  OnboardingModel(
    title: 'Your All-in-One Financial Hub',
    subTitle:
        'Padi4Life connects you with friends, local services, manage your money, get small loans when you need them. It works in three simple steps ',
    imagePath: 'assets/images/oboardingImage1.png',
  ),
  OnboardingModel(
    title: 'Connect With Others And Earn',
    subTitle:
        'Connect on Padi4Life, share resources, and earn rewards through social and financial interactions, making money management a social experience',
    imagePath: 'assets/images/oboardingImage2.png',
  ),
  OnboardingModel(
    title: 'Get Quick And Safe Loan',
    subTitle:
        'Secure fast loans with ease on Padi4Life, for a convenient and safe borrowing experience and satisfy your financial needs.',
    imagePath: 'assets/images/oboardingImage3.png',
  ),
  OnboardingModel(
    title: 'Manage Your Funds Perfectly',
    subTitle:
        'Effortlessly optimize your finances with Padi4Life with tools and insights for flawless money management, making every dollar count',
    imagePath: 'assets/images/oboardingImage4.png',
  ),
];

class OnboardingModel {
  final String title, subTitle, imagePath;

  OnboardingModel({
    required this.title,
    required this.subTitle,
    required this.imagePath,
  });
}
