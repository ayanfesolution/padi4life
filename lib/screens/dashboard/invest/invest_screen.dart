import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/utils/app_componenet/corner_padded_widget.dart';
import 'package:padi4life/utils/app_componenet/padded.dart';
import 'package:padi4life/utils/constants.dart';

class InvestScreen extends StatefulHookConsumerWidget {
  const InvestScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _InvestScreenState();
}

class _InvestScreenState extends ConsumerState<InvestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padded(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Gap(autoAdjustHeight(56)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SvgPicture.asset('assets/svgs/searchIcon.svg'),
                    Gap(autoAdjustWidth(12)),
                    SvgPicture.asset('assets/svgs/noNotificationBell.svg'),
                    Gap(autoAdjustWidth(12)),
                  ],
                ),
                CornerPaddedWidget(
                  color: Colors.black.withOpacity(0.05000000074505806),
                  padding: 10,
                  child: Row(
                    children: [
                      Text(
                        'Donation',
                        style: kTextStyleCustom(
                          color: Colors.black,
                          fontSize: autoAdjustHeight(11),
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      Gap(autoAdjustWidth(5)),
                      Container(
                        width: 24,
                        height: 24,
                        decoration: const ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://via.placeholder.com/24x24"),
                            fit: BoxFit.fill,
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Gap(autoAdjustHeight(53)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Investment Overview',
                  style: kTextStyleCustom(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                CornerPaddedWidget(
                  color: Colors.black.withOpacity(0.05000000074505806),
                  padding: 10,
                  child: Row(
                    children: [
                      Text(
                        'Donation',
                        style: kTextStyleCustom(
                          color: Colors.black,
                          fontSize: autoAdjustHeight(11),
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      Gap(autoAdjustWidth(5)),
                      SvgPicture.asset('assets/svgs/ep_arrow-down.svg')
                    ],
                  ),
                ),
              ],
            ),
            Gap(autoAdjustHeight(18)),
            Container(
              width: double.maxFinite,
              decoration: ShapeDecoration(
                color: Colors.black.withOpacity(0.05000000074505806),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(width: 0.50, color: Color(0xFFB4B4B4)),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: autoAdjustWidth(18),
                  vertical: autoAdjustHeight(16),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Savings',
                          style: kTextStyleCustom(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                        CornerPaddedWidget(
                          color: Colors.black.withOpacity(0.05000000074505806),
                          padding: 10,
                          child: Row(
                            children: [
                              Text(
                                'This Month',
                                style: kTextStyleCustom(
                                  color: Colors.black,
                                  fontSize: autoAdjustHeight(11),
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              Gap(autoAdjustWidth(5)),
                              SvgPicture.asset('assets/svgs/ep_arrow-down.svg')
                            ],
                          ),
                        ),
                      ],
                    ),
                    Gap(autoAdjustHeight(18)),
                    ListTile(
                      leading: SvgPicture.asset(
                          'assets/svgs/clarity_coin-bag-line.svg'),
                      title: Text(
                        'Mutual Funds',
                        style: kTextStyleCustom(
                          color: const Color(0xFF191919),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      subtitle: Text(
                        'Monthly income 18%',
                        style: kTextStyleCustom(
                          color: const Color(0xFF444444),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      trailing: Text(
                        '\$121.56',
                        style: kTextStyleCustom(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    const ProgressionBar(
                      length: 10,
                    ),
                    Gap(autoAdjustHeight(8)),
                    ListTile(
                      leading: SvgPicture.asset(
                          'assets/svgs/material-symbols_real-estate-agent-outline.svg'),
                      title: Text(
                        'Real Estate',
                        style: kTextStyleCustom(
                          color: const Color(0xFF191919),
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                      subtitle: Text(
                        'Monthly income 7%',
                        style: kTextStyleCustom(
                          color: const Color(0xFF444444),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      trailing: Text(
                        '\$109.56',
                        style: kTextStyleCustom(
                          color: Colors.black,
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                    const ProgressionBar(
                      length: 2,
                      active: Color(0xFFCE8CC1),
                      inActive: Color(0xFFDFC6DA),
                    ),
                  ],
                ),
              ),
            ),
            Gap(autoAdjustHeight(43)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Performance',
                  style: kTextStyleCustom(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                CornerPaddedWidget(
                  color: Colors.black.withOpacity(0.05000000074505806),
                  padding: 10,
                  child: Row(
                    children: [
                      Text(
                        'View all',
                        style: kTextStyleCustom(
                          color: Colors.black,
                          fontSize: autoAdjustHeight(11),
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                      ),
                      Gap(autoAdjustWidth(5)),
                      SvgPicture.asset('assets/svgs/ep_arrow-up.svg')
                    ],
                  ),
                ),
              ],
            ),
            Gap(autoAdjustHeight(50)),
            Image.asset(
              'assets/images/chat_loading.png',
            ),
            Image.asset(
              'assets/images/time.png',
            ),
            Gap(autoAdjustHeight(35))
          ],
        ),
      ),
    );
  }
}

class ProgressionBar extends StatelessWidget {
  const ProgressionBar({
    super.key,
    this.inActive = const Color(0xFFB5AFCD),
    this.active = const Color(0xFF412D95),
    required this.length,
  });
  final Color active, inActive;
  final double length;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: 5,
          decoration: ShapeDecoration(
            color: inActive,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
        Container(
          width: MediaQuery.sizeOf(context).width / length,
          height: 5,
          decoration: ShapeDecoration(
            color: active,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
        ),
      ],
    );
  }
}
