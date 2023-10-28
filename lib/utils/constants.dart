import 'package:auto_adjust/auto_adjust.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'app_color.dart';

TextStyle kTextStyleCustom({
  Color color = kBLKCOLOUR,
  double fontSize = 16,
  FontStyle fontStyle = FontStyle.normal,
  FontWeight fontWeight = FontWeight.w400,
  double height = 0,
}) {
  return TextStyle(
    fontSize: autoAdjustHeight(fontSize),
    fontWeight: fontWeight,
    fontStyle: fontStyle,
    fontFamily: 'Poppins',
    height: height,
    color: color,
  );
}

kToastMsgPopUp(String msg, ToastGravity toastGravity) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: toastGravity,
    timeInSecForIosWeb: 2,
    backgroundColor: kPRYCOLOUR,
    textColor: Colors.white,
    fontSize: autoAdjustHeight(16),
  );
}


String formatDateTwo(DateTime timeStamp) {
  return DateFormat('dd/MM/yyyy HH:mm:ss a').format(timeStamp);
}

String formatDateOne(DateTime timeStamp) {
  return DateFormat('dd, MMM yyyy, hh:mm:ss a').format(timeStamp);
}
