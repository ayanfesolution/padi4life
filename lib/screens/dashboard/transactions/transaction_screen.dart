import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/utils/app_color.dart';
import 'package:padi4life/utils/app_componenet/padded.dart';
import 'package:padi4life/utils/app_componenet/padi4life_button.dart';
import 'package:padi4life/utils/constants.dart';

import '../../onboarding/onboarding_page.dart';

class ActivitiesScreen extends StatefulHookConsumerWidget {
  const ActivitiesScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ActivitiesScreenState();
}

class _ActivitiesScreenState extends ConsumerState<ActivitiesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: autoAdjustHeight(160),
            width: double.maxFinite,
            color: kWHTCOLOUR,
            child: Padded(
              child: Column(
                children: [
                  Gap(
                    autoAdjustHeight(55),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset('assets/images/Padi4LifeLogo.png'),
                      Row(
                        children: [
                          SvgPicture.asset('assets/svgs/searchIcon.svg'),
                          Gap(autoAdjustWidth(12)),
                          SvgPicture.asset(
                              'assets/svgs/noNotificationBell.svg'),
                          Gap(autoAdjustWidth(12)),
                          SvgPicture.asset('assets/svgs/emailIcon.svg'),
                        ],
                      ),
                    ],
                  ),
                  Gap(autoAdjustHeight(12)),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        const UserStories(),
                        Gap(autoAdjustWidth(5)),
                        for (var i = 0; i < 10; i++)
                          Padding(
                            padding: EdgeInsets.only(
                              left: autoAdjustWidth(5),
                              right: autoAdjustWidth(5),
                            ),
                            child: const UserStories(),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(autoAdjustHeight(31)),
          Expanded(
            child: Padded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  Container(
                    width: autoAdjustWidth(340),
                    height: autoAdjustHeight(165),
                    clipBehavior: Clip.antiAlias,
                    padding: EdgeInsets.symmetric(
                      vertical: autoAdjustHeight(21),
                      horizontal: autoAdjustWidth(25),
                    ),
                    decoration: ShapeDecoration(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextFormField(
                          maxLines: 1,
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.all(autoAdjustHeight(20)),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: const ShapeDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                      "https://via.placeholder.com/30x30",
                                    ),
                                    fit: BoxFit.fill,
                                  ),
                                  shape: OvalBorder(),
                                ),
                              ),
                            ),
                            hintText: 'Write something...',
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                    'assets/svgs/system-uicons_picture.svg'),
                                Gap(autoAdjustWidth(12)),
                                SvgPicture.asset(
                                    'assets/svgs/system-uicons_video.svg'),
                                Gap(autoAdjustWidth(12)),
                                SvgPicture.asset('assets/svgs/eyesicon.svg'),
                                Gap(autoAdjustWidth(12)),
                                SvgPicture.asset(
                                    'assets/svgs/basil_location-outline.svg'),
                              ],
                            ),
                            Padi4LifeMainButton(
                              width: 59,
                              height: 40,
                              text: 'Post',
                              onTap: () {},
                            ),
                          ],
                        ),
                        //  const Divider()
                      ],
                    ),
                  ),
                  Gap(autoAdjustHeight(31)),
                  for (var i = 0; i < 10; i++) const SinglePostWidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SinglePostWidget extends StatelessWidget {
  const SinglePostWidget({
    super.key,
  });
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: autoAdjustWidth(340),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Gap(autoAdjustHeight(25)),
          Padded(
            child: Row(
              children: [
                Container(
                  width: 30,
                  height: 30,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage(
                        "https://via.placeholder.com/30x30",
                      ),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                Gap(autoAdjustWidth(8)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Elon Musk',
                        textAlign: TextAlign.center,
                        style: kTextStyleCustom(
                          color: const Color(0xFF4C4C4C),
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        '@elon_musk',
                        textAlign: TextAlign.center,
                        style: kTextStyleCustom(
                          color: const Color(0xFF4C4C4C),
                          fontSize: 6,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
                SvgPicture.asset('assets/svgs/pepicons-pencil_dots-y.svg')
              ],
            ),
          ),
          Gap(autoAdjustHeight(17)),
          Padded(
            child: Text(
              'Tesla shareholders can win tickets to Cybertruck delivery event in Texas. Shareholders to attend the company’s upcoming Cybertruck event.',
              style: kTextStyleCustom(
                color: Colors.black,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Gap(autoAdjustHeight(21)),
          SizedBox(
            width: double.maxFinite,
            height: autoAdjustHeight(247),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    width: autoAdjustWidth(286),
                    height: autoAdjustHeight(247),
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image:
                            NetworkImage("https://via.placeholder.com/286x247"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.maxFinite,
                    height: autoAdjustHeight(58),
                    padding: EdgeInsets.only(
                      top: autoAdjustHeight(10),
                      left: autoAdjustWidth(17),
                      right: autoAdjustWidth(16),
                      bottom: autoAdjustHeight(4),
                    ),
                    clipBehavior: Clip.antiAlias,
                    decoration: const ShapeDecoration(
                      gradient: LinearGradient(
                        end: Alignment(1.00, -0.003),
                        begin: Alignment(-1, 0.28),
                        colors: [Color(0xFF4B010E), Color(0x004B010E)],
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: autoAdjustWidth(14)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ActionAndInfo(
                            imagePath: 'assets/svgs/icon-park-outline_like.svg',
                            totalNumber: '2, 239',
                            onTap: () {},
                          ),
                          ActionAndInfo(
                            imagePath:
                                'assets/svgs/ant-design_comment-outlined.svg',
                            totalNumber: '430',
                            onTap: () {},
                          ),
                          ActionAndInfo(
                            imagePath: 'assets/svgs/mdi-light_share.svg',
                            totalNumber: '39',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Gap(autoAdjustHeight(13)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0; i < 4; i++)
                Row(
                  children: [
                    const SmallCircleWidget(
                      isITActive: true,
                    ),
                    Gap(autoAdjustWidth(8)),
                  ],
                ),
            ],
          ),
          Gap(autoAdjustHeight(8)),
        ],
      ),
    );
  }
}

class ActionAndInfo extends StatelessWidget {
  const ActionAndInfo({
    super.key,
    required this.imagePath,
    required this.totalNumber,
    required this.onTap,
  });
  final String imagePath, totalNumber;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onTap,
          child: SvgPicture.asset(
            imagePath,
          ),
        ),
        Gap(autoAdjustWidth(10)),
        Text(
          totalNumber,
          textAlign: TextAlign.center,
          style: kTextStyleCustom(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class UserStories extends StatelessWidget {
  const UserStories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: autoAdjustWidth(40),
          height: autoAdjustHeight(40),
          decoration: const ShapeDecoration(
            shape: OvalBorder(
              side: BorderSide(
                width: 1,
                color: Color(0xFFC2C2C2),
              ),
            ),
          ),
          padding: EdgeInsets.all(
            autoAdjustHeight(4),
          ),
          child: Container(
            decoration: const ShapeDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://via.placeholder.com/28x28",
                ),
                fit: BoxFit.fill,
              ),
              shape: OvalBorder(),
            ),
          ),
        ),
        Text(
          'Amish',
          style: TextStyle(
            fontSize: autoAdjustHeight(7),
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
      ],
    );
  }
}
