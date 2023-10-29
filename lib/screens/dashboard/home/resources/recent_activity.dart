import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/utils/app_componenet/padded.dart';
import 'package:padi4life/utils/app_componenet/padi4life_textfield.dart';
import 'package:padi4life/utils/constants.dart';

import '../../../../utils/app_componenet/corner_padded_widget.dart';

class RecentActivity extends StatefulHookConsumerWidget {
  const RecentActivity({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RecentActivityState();
}

class _RecentActivityState extends ConsumerState<RecentActivity> {
  @override
  Widget build(BuildContext context) {
    var search = useTextEditingController();
    return Expanded(
      child: Column(
        children: [
          Padded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Activity',
                  style: kTextStyleCustom(
                      fontWeight: FontWeight.w600, fontSize: 13),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padi4LifeTextFormField(
                          controller: search,
                          hintText: 'Search',
                          prefixIcon: const Icon(Icons.search),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CornerPaddedWidget(
                        padding: 10,
                        child: SvgPicture.asset(
                          'assets/svgs/menu.svg',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recentActivityList.length,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                final items = recentActivityList[index];
                return RecentItem(
                  title: items.title,
                  subTitle: items.subTitle,
                  activity: items.activity,
                  amount: items.amount,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class RecentItem extends StatelessWidget {
  const RecentItem(
      {super.key,
      required this.title,
      required this.amount,
      required this.subTitle,
      required this.activity});

  final String title;
  final String subTitle;
  final String amount;
  final String activity;
  @override
  Widget build(BuildContext context) {
    return Padded(
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 20,
              ),
              const SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: kTextStyleCustom(
                          fontWeight: FontWeight.w300, fontSize: 15),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      subTitle,
                      style: kTextStyleCustom(
                          fontWeight: FontWeight.w400, fontSize: 12),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    amount,
                    style: kTextStyleCustom(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: const Color(0xFF412D95)),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    activity,
                    style: kTextStyleCustom(
                        fontWeight: FontWeight.w400, fontSize: 12),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

class RecentActivityModel {
  final String title;
  final String subTitle;
  final String amount;
  final String activity;

  RecentActivityModel(
      {required this.title,
      required this.amount,
      required this.subTitle,
      required this.activity});
}

List<RecentActivityModel> recentActivityList = [
  RecentActivityModel(
    title: 'David Martins',
    amount: '+300',
    subTitle: '9:12 am - Sept 15th, 2023',
    activity: 'Loan Payoff',
  ),
  RecentActivityModel(
    title: 'Onyinyechi Adeola',
    amount: '+800',
    subTitle: '9:12 am - Sept 15th, 2023',
    activity: 'Loan Payoff',
  ),
  RecentActivityModel(
    title: 'David Martins',
    amount: '+30',
    subTitle: '9:12 am - Sept 15th, 2023',
    activity: 'Loan Payoff',
  ),
  RecentActivityModel(
    title: 'David Martins',
    amount: '+150',
    subTitle: '9:12 am - Sept 15th, 2023',
    activity: 'Loan Payoff',
  )
];
