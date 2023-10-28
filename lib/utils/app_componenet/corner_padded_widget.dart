import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import '../app_color.dart';

class CornerPaddedWidget extends StatelessWidget {
  const CornerPaddedWidget({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(autoAdjustHeight(20)),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: kPRYCOLOUR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(autoAdjustHeight(60)),
        ),
      ),
      child: child,
    );
  }
}
