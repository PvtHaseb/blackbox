// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


// Utilites Class
class Specs {

  Color cBlue_200 = (Colors.blue[200])!;
  Color cBlue_300 = (Colors.blue[300])!;
  Color cBlue_400 = (Colors.blue[400])!;

  Color cRed_200 = (Colors.red[200])!;
  Color cRed_300 = (Colors.red[300])!;
  Color cRed_400 = (Colors.red[400])!;
  Color cRed_500 = (Colors.red[500])!;
  Color cRed = (Colors.red);

  Color cYellow_200 = (Colors.yellow[200])!;
  Color cYellow_300 = (Colors.yellow[300])!;
  Color cYellow_400 = (Colors.yellow[400])!;

  Color cOrange_200 = (Colors.orange[200])!;
  Color cOrange_300 = (Colors.orange[300])!;
  Color cOrange_400 = (Colors.orange[400])!;

  Color cGray_200 = (Colors.grey[200])!;
  Color cGray_300 = (Colors.grey[300])!;
  Color cGray_400 = (Colors.grey[400])!;

  Color cPurple_100 = (Colors.purple[100])!;
  Color cPurple_150 = (const Color.fromARGB(255, 165, 109, 174));
  Color cPurple_200 = (Colors.purple[200])!;
  Color cPurple_300 = (Colors.purple[300])!;
  Color cPurple_400 = (Colors.purple[400])!;
  Color cPurple_500 = (Colors.purple[500])!;

  Color cCyanRGB = const Color.fromARGB(255, 55, 140, 150);

  Color cBlackRGB = const Color.fromARGB(0, 0, 0, 0);
  Color cBlack = (Colors.black);

  double btnWidth_150 = 150.0;
  double btnWidth_250 = 250.0;
  double btnWidth_350 = 350.0;

  double btnHeight_30 = 30.0;
  double btnHeight_40 = 40.0;
  double btnHeight_50 = 50.0;

  Icon icon = const Icon(Icons.access_alarm);
  // Icon icon_ = const Icon(Icons.);
  // Icon icon_ = const Icon(Icons.);
  // Icon icon_ = const Icon(Icons.);

}


class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}


// class NumberConversion{
// dynamic toArNumber(dynamic enNumber) {
//   if (enNumber.toString().isNotEmpty) {
//     NumberFormat formatter = NumberFormat('#.##', 'ar_EG');
//     dynamic arNumber = formatter.format(enNumber);
//     return arNumber.toString();
//   }
//   else{
//     NumberFormat formatter = NumberFormat('#.##', 'ar_EG');
//     dynamic arNumber = formatter.format(enNumber);
//     return arNumber;
//   }
// }
// }

dynamic toArNumber(dynamic enNumber) {
  if (enNumber.toString().isNotEmpty) {
    NumberFormat formatter = NumberFormat('#.##', 'ar_EG');
    dynamic arNumber = formatter.format(enNumber);
    return arNumber.toString();
  }
  else{
    NumberFormat formatter = NumberFormat('#.##', 'ar_EG');
    dynamic arNumber = formatter.format(enNumber);
    return arNumber;
  }
}

//String? inspectorUrl;