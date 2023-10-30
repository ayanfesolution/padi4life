import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';
import 'package:lottie/lottie.dart';

class CXSpinner extends StatelessWidget {
  const CXSpinner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: autoAdjustHeight(150),
          child: Lottie.asset('assets/loading.json')),
    );
  }
}

class CXLoader {
  static void show(BuildContext context) {
    return Loader.show(
      context,
      progressIndicator: const CXSpinner(),
      overlayColor: Colors.black54,
    );
  }

  static void hide() {
    return Loader.hide();
  }
}
