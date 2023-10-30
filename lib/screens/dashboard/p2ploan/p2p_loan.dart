import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/utils/app_color.dart';
import 'package:padi4life/utils/app_componenet/coming_soon.dart';
import 'package:padi4life/utils/app_componenet/corner_padded_widget.dart';
import 'package:padi4life/utils/app_componenet/padded.dart';
import 'package:padi4life/utils/app_componenet/padi4life_button.dart';

import '../../../utils/constants.dart';

class P2PLoanScreen extends StatefulHookConsumerWidget {
  const P2PLoanScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _P2PLoanScreenState();
}

class _P2PLoanScreenState extends ConsumerState<P2PLoanScreen> {
  @override
  Widget build(BuildContext context) {
    List<Widget> screenToShow = [
      const LendScreen(),
      const BorrowScreen(),
    ];
    var currentIndex = useState(0);
    return Scaffold(
      body: Padded(
        child: Column(
          children: [
            Gap(autoAdjustHeight(56)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(Icons.menu),
                Text(
                  'P2P Loan',
                  style: kTextStyleCustom(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SvgPicture.asset(
                  'assets/svgs/pepicons-pencil_dots-y copy.svg',
                ),
              ],
            ),
            Gap(autoAdjustHeight(36)),
            CornerPaddedWidget(
              padding: 10,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      currentIndex.value = 0;
                    },
                    child: CornerPaddedWidget(
                      color: currentIndex.value == 0
                          ? const Color(0xFFCE8CC1)
                          : Colors.transparent,
                      padding: 6,
                      child: Text(
                        'Lend',
                        textAlign: TextAlign.center,
                        style: kTextStyleCustom(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  Gap(autoAdjustWidth(12)),
                  InkWell(
                    onTap: () {
                      currentIndex.value = 1;
                    },
                    child: CornerPaddedWidget(
                      padding: 6,
                      color: currentIndex.value == 1
                          ? const Color(0xFFCE8CC1)
                          : Colors.transparent,
                      child: Text(
                        'Borrow',
                        textAlign: TextAlign.center,
                        style: kTextStyleCustom(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child: screenToShow[currentIndex.value],
            ),
          ],
        ),
      ),
    );
  }
}

class LendScreen extends StatelessWidget {
  const LendScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> listOfRange = [
      '₦ (1k-10k)',
      '₦ (10k-50k)',
      '₦ (50k-100k)',
      '₦ (100k-500k)',
      '₦ (500k-1M)',
      '₦ (1M-5M)',
    ];
    return Column(
      children: [
        Gap(autoAdjustHeight(25)),
        Container(
          width: double.maxFinite,
          height: autoAdjustHeight(30),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: ShapeDecoration(
            color: Colors.black.withOpacity(0.05000000074505806),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFB3B3B3)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < listOfRange.length; i++)
                Text(
                  listOfRange[i],
                  style: kTextStyleCustom(
                    //color:  const Color(0xFF412D95),
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                )
            ],
          ),
        ),
        Gap(autoAdjustHeight(21)),
        const WordedLine(
          title: 'Best Peers',
        ),
        Gap(autoAdjustHeight(27)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var i = 0; i < 7; i++)
                Padding(
                  padding: EdgeInsets.only(
                    left: autoAdjustWidth(i == 0 ? 0 : 8),
                    right: autoAdjustWidth(8),
                  ),
                  child: const PeersWidget(),
                ),
            ],
          ),
        ),
        Gap(autoAdjustHeight(21)),
        const WordedLine(
          title: 'All Offers',
        ),
        Gap(autoAdjustHeight(16)),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              for (var i = 0; i < 8; i++)
                Padding(
                  padding: EdgeInsets.only(
                    top: autoAdjustHeight(i == 0 ? 0 : 8),
                    bottom: autoAdjustWidth(8),
                  ),
                  child: const LoanOffersWidget(
                    isItBorrow: false,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class BorrowScreen extends StatelessWidget {
  const BorrowScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> listOfRange = [
      '₦ (1k-10k)',
      '₦ (10k-50k)',
      '₦ (50k-100k)',
      '₦ (100k-500k)',
      '₦ (500k-1M)',
      '₦ (1M-5M)',
    ];
    return Column(
      children: [
        Gap(autoAdjustHeight(25)),
        Container(
          width: double.maxFinite,
          height: autoAdjustHeight(30),
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: ShapeDecoration(
            color: Colors.black.withOpacity(0.05000000074505806),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0xFFB3B3B3)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              for (var i = 0; i < listOfRange.length; i++)
                Text(
                  listOfRange[i],
                  style: kTextStyleCustom(
                    //color:  const Color(0xFF412D95),
                    fontSize: 8,
                    fontWeight: FontWeight.w700,
                  ),
                )
            ],
          ),
        ),
        Gap(autoAdjustHeight(21)),
        const WordedLine(
          title: 'Best Peers',
        ),
        Gap(autoAdjustHeight(27)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              for (var i = 0; i < 7; i++)
                Padding(
                  padding: EdgeInsets.only(
                    left: autoAdjustWidth(i == 0 ? 0 : 8),
                    right: autoAdjustWidth(8),
                  ),
                  child: const PeersWidget(),
                ),
            ],
          ),
        ),
        Gap(autoAdjustHeight(21)),
        const WordedLine(
          title: 'All Offers',
        ),
        Gap(autoAdjustHeight(16)),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              for (var i = 0; i < 8; i++)
                Padding(
                  padding: EdgeInsets.only(
                    top: autoAdjustHeight(i == 0 ? 0 : 8),
                    bottom: autoAdjustWidth(8),
                  ),
                  child: const LoanOffersWidget(
                    isItBorrow: true,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class LoanOffersWidget extends StatelessWidget {
  const LoanOffersWidget({
    super.key,
    required this.isItBorrow,
  });
  final bool isItBorrow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: autoAdjustHeight(162),
      decoration: ShapeDecoration(
        color: Colors.black.withOpacity(0.05000000074505806),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFFB4B4B4)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: autoAdjustWidth(21), vertical: autoAdjustHeight(24)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: const ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://via.placeholder.com/28x28"),
                      fit: BoxFit.fill,
                    ),
                    shape: OvalBorder(),
                  ),
                ),
                Gap(autoAdjustWidth(8)),
                Expanded(
                  child: Text(
                    'Joseph Jones',
                    style: kTextStyleCustom(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ),
                Text(
                  '104 trades   100.00%',
                  style: kTextStyleCustom(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
              ],
            ),
            Gap(autoAdjustHeight(27)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Amount: ',
                          textAlign: TextAlign.center,
                          style: kTextStyleCustom(
                            color: const Color(0xFF4E4E4E),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'NGN 8,500',
                          style: kTextStyleCustom(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Limit: ',
                          textAlign: TextAlign.center,
                          style: kTextStyleCustom(
                            color: const Color(0xFF4E4E4E),
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          'NGN 1k -NGN 10k',
                          style: kTextStyleCustom(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                Padi4LifeMainButton(
                  width: isItBorrow ? 69 : 61,
                  height: 40,
                  text: isItBorrow ? 'Borrow' : 'Lend',
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const ComingSoonPopup();
                      },
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PeersWidget extends StatelessWidget {
  const PeersWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: autoAdjustWidth(84),
      height: autoAdjustHeight(95),
      decoration: ShapeDecoration(
        color: Colors.black.withOpacity(0.05000000074505806),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFFB4B4B4)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
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
            style: kTextStyleCustom(
              fontSize: 7,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
          Text(
            '10,788 trades',
            style: kTextStyleCustom(
              color: const Color(0xFF504F4F),
              fontSize: 6,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ],
      ),
    );
  }
}

class WordedLine extends StatelessWidget {
  const WordedLine({
    super.key,
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: autoAdjustWidth(32),
          child: SvgPicture.asset('assets/svgs/Line3.svg'),
        ),
        Text(
          title,
          style: kTextStyleCustom(
            color: const Color(0xFF232323),
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(
          width: autoAdjustWidth(220),
          child: SvgPicture.asset(
            'assets/svgs/Line4.svg',
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
