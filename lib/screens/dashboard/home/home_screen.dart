import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/screens/dashboard/home/resources/recent_activity.dart';
import 'package:padi4life/screens/dashboard/home/resources/wallet_section.dart';

import 'package:padi4life/utils/constants.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      body: Column(
        children: [
          WalletSection(),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Activity(
                image: 'send.svg',
                title: 'Send',
                color: 0xFF412D95,
              ),
              Activity(
                image: 'receive.svg',
                title: 'Receive',
                color: 0xFFCE8CC1,
              ),
              Activity(
                image: 'connect.svg',
                title: 'Connect',
                color: 0xFF955FAE,
              ),
              Activity(
                image: 'post.svg',
                title: 'Post',
                color: 0xFF897BDC,
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          RecentActivity()
        ],
      ),
    );
  }
}

class Activity extends StatelessWidget {
  const Activity(
      {super.key,
      required this.title,
      required this.image,
      required this.color});
  final String title;
  final String image;
  final int color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(autoAdjustHeight(15)),
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            color: Color(color),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(autoAdjustHeight(10)),
            ),
          ),
          child: SvgPicture.asset(
            'assets/svgs/$image',
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          title,
          style: kTextStyleCustom(fontWeight: FontWeight.w400, fontSize: 13),
        ),
      ],
    );
  }
}
