import 'package:flutter/material.dart';
import 'package:padi4life/utils/constants.dart';

class ComingSoonPopup extends StatelessWidget {
  const ComingSoonPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Coming Soon',
        style: kTextStyleCustom(),
      ),
      content: Text(
        'This feature is currently under development and will be available soon.',
        style: kTextStyleCustom(),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'OK',
            style: kTextStyleCustom(),
          ),
        ),
      ],
    );
  }
}
