import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:padi4life/utils/app_color.dart';
import 'package:padi4life/utils/app_componenet/padded.dart';

import '../../../utils/constants.dart';

class WalletScreen extends StatefulHookConsumerWidget {
  const WalletScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WalletScreenState();
}

class _WalletScreenState extends ConsumerState<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padded(
        child: ListView(
          padding: EdgeInsetsDirectional.zero,
          children: [
            Gap(autoAdjustHeight(56)),
            Center(
              child: Text(
                'Wallet',
                style: kTextStyleCustom(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
            Gap(autoAdjustHeight(13)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'My Cards',
                  style: kTextStyleCustom(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                Text(
                  'Manage',
                  style: kTextStyleCustom(
                    color: kPRYCOLOUR,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                )
              ],
            ),
            Gap(autoAdjustHeight(20)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: autoAdjustWidth(155),
                  height: autoAdjustHeight(195),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF412D95),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.04),
                    ),
                  ),
                  child: Padded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: autoAdjustHeight(13),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SvgPicture.asset('assets/svgs/walletshape.svg'),
                              SvgPicture.asset(
                                  'assets/svgs/logos_mastercard.svg')
                            ],
                          ),
                          Gap(autoAdjustHeight(5.3)),
                          Text(
                            'No. 816773',
                            style: kTextStyleCustom(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    'Damian Dalu',
                                    style: kTextStyleCustom(
                                      color: Colors.white,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                  Text(
                                    '***8411',
                                    style: kTextStyleCustom(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      height: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: autoAdjustWidth(4)),
                  child: Container(
                    width: autoAdjustWidth(155),
                    height: autoAdjustHeight(195),
                    decoration: ShapeDecoration(
                      color: const Color(0xFFAEA3DF),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 2.12,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF412D95),
                        ),
                        borderRadius: BorderRadius.circular(15.04),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/svgs/ic_round-add-card.svg'),
                        Text(
                          'Add new card',
                          textAlign: TextAlign.center,
                          style: kTextStyleCustom(
                            color: kPRYCOLOUR,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Gap(autoAdjustHeight(69)),
            Text(
              'Account Balance',
              style: kTextStyleCustom(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            ),
            Gap(autoAdjustHeight(28)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BalanceDisplayWidget(
                  balanceName: 'Personal pocket',
                  balanceAmount: 'NGN 895, 456.56',
                  imagePath: 'assets/svgs/hvgsdh.svg',
                ),
                BalanceDisplayWidget(
                  balanceName: 'Padicoins',
                  balanceAmount: '56, 065',
                  imagePath: 'assets/svgs/game-icons_coins.svg',
                ),
              ],
            ),
            Gap(autoAdjustHeight(10)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BalanceDisplayWidget(
                  balanceName: 'P2P Loan Wallet',
                  balanceAmount: 'NGN 95, 456.56',
                  imagePath: 'assets/svgs/kkother.svg',
                ),
                BalanceDisplayWidget(
                  balanceName: 'Padicoins',
                  balanceAmount: 'NGN 895, 456.56',
                  imagePath: 'assets/svgs/bytesize_portfolio.svg',
                ),
              ],
            ),
            Gap(autoAdjustHeight(35)),
          ],
        ),
      ),
    );
  }
}

class BalanceDisplayWidget extends StatelessWidget {
  const BalanceDisplayWidget({
    super.key,
    required this.balanceName,
    required this.balanceAmount,
    required this.imagePath,
  });
  final String balanceName, balanceAmount, imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: autoAdjustWidth(165),
      height: autoAdjustHeight(157),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.black.withOpacity(0.05000000074505806),
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.50, color: Color(0xFFB4B4B4)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Padded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(autoAdjustHeight(21)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset(imagePath),
                SvgPicture.asset(
                  'assets/svgs/pepicons-pencil_dots-y copy.svg',
                ),
              ],
            ),
            Gap(autoAdjustHeight(34)),
            FittedBox(
              child: Text(
                balanceAmount,
                style: kTextStyleCustom(
                  color: const Color(0xFF222222),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  height: 0.15,
                ),
              ),
            ),
            Gap(autoAdjustHeight(10)),
            Text(
              balanceName,
              textAlign: TextAlign.center,
              style: kTextStyleCustom(
                color: const Color(0xFF3A3A3A),
                fontSize: 9,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
