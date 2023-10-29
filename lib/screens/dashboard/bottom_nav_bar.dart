import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/screens/dashboard/asset_token/asset_token_screen.dart';
import 'package:padi4life/screens/dashboard/dashboard/dashboard_screen.dart';
import 'package:padi4life/screens/dashboard/loan/loan_screen.dart';
import 'package:padi4life/screens/dashboard/transactions/transaction_screen.dart';
import 'package:padi4life/utils/app_color.dart';

import 'home/home_screen.dart';

class BottomNavBar extends StatefulHookConsumerWidget {
  const BottomNavBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends ConsumerState<BottomNavBar> {
  List<Widget> screenToShow = [
    const HomeScreen(),
    const TransactionScreen(),
    const LoanScreen(),
    const AssetTokenScreen(),
    const DashboardScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var indexToShow = useState(0);
    return Scaffold(
      body: screenToShow[indexToShow.value],
      bottomNavigationBar: Padi4LifeButtomNavBar(
        indexToShow: indexToShow,
      ),
    );
  }
}

class Padi4LifeButtomNavBar extends StatelessWidget {
  const Padi4LifeButtomNavBar({
    super.key,
    required this.indexToShow,
  });

  final ValueNotifier<int> indexToShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: autoAdjustHeight(83),
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: autoAdjustHeight(40)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavigationWidget(
              isItActive: indexToShow.value == 0,
              activeIcon: 'assets/svgs/icon1.svg',
              inActiveIcon: 'assets/svgs/icon1.svg',
              onTap: () {
                indexToShow.value = 0;
              },
            ),
            BottomNavigationWidget(
              isItActive: indexToShow.value == 1,
              activeIcon: 'assets/svgs/icon2.svg',
              inActiveIcon: 'assets/svgs/icon2.svg',
              onTap: () {
                indexToShow.value = 1;
              },
            ),
            BottomNavigationWidget(
              isItActive: indexToShow.value == 2,
              activeIcon: 'assets/svgs/icon3.svg',
              inActiveIcon: 'assets/svgs/icon3.svg',
              onTap: () {
                indexToShow.value = 2;
              },
            ),
            BottomNavigationWidget(
              isItActive: indexToShow.value == 3,
              activeIcon: 'assets/svgs/icon4.svg',
              inActiveIcon: 'assets/svgs/icon4.svg',
              onTap: () {
                indexToShow.value = 3;
              },
            ),
            BottomNavigationWidget(
              isItActive: indexToShow.value == 4,
              activeIcon: 'assets/svgs/icon5.svg',
              inActiveIcon: 'assets/svgs/icon5.svg',
              onTap: () {
                indexToShow.value = 4;
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({
    super.key,
    required this.isItActive,
    required this.activeIcon,
    required this.inActiveIcon,
    required this.onTap,
  });

  final bool isItActive;
  final String activeIcon, inActiveIcon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(
          vertical: autoAdjustHeight(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: autoAdjustHeight(20),
              width: autoAdjustWidth(20),
              child: SvgPicture.asset(
                isItActive == true ? activeIcon : inActiveIcon,
                fit: BoxFit.contain,
                color: isItActive ? kPRYCOLOUR : kINACTIVECOLOR,
              ),
            ),
            Gap(autoAdjustHeight(10)),
            // CircleAvatar(
            //   radius: autoAdjustHeight(5),
            //   backgroundColor: isItActive == true ? kPRYCOLOUR : kINACTIVECOLOR,
            // ),
          ],
        ),
      ),
    );
  }
}
