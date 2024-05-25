import 'package:ecdesk/forms/login_form.dart';
import 'package:ecdesk/widgets/qrcode_scanner.dart';
import 'package:flutter/material.dart';

class Routes{
  static String qrcode="qrcode";
  static String login="login";
}

final pages={
  Routes.qrcode:(context)=>const QRViewExample(),
  Routes.login:(context)=> LoginForm(),
};