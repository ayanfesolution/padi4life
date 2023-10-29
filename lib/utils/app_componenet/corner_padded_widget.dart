import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import '../app_color.dart';

class CornerPaddedWidget extends StatelessWidget {
  const CornerPaddedWidget({
    super.key,
    required this.child,
    this.color = kPRYCOLOUR,
    this.padding = 20,
  });
  final Widget child;
  final Color color;
  final double padding;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(autoAdjustHeight(padding)),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(autoAdjustHeight(padding)),
        ),
      ),
      child: child,
    );
  }
}
