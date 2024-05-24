import 'package:ecdesk/widgets/qrcode_scanner.dart';
import 'package:flutter/material.dart';

class Routes{
  static String qrcode="qrcode";
}

final pages={
  Routes.qrcode:(context)=>const QRViewExample(),
};