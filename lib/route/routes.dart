import 'package:ecdesk/forms/login_form.dart';
import 'package:ecdesk/responsive/desktop_scaffold.dart';
import 'package:ecdesk/widgets/qrcode_scanner.dart';

class Routes{
  static String qrcode="qrcode";
  static String login="login";
  static String dashboard="dashboard";
}

final pages={
  Routes.qrcode:(context)=>const QRViewExample(),
  Routes.login:(context)=> LoginForm(),
  Routes.dashboard:(context)=> const DesktopScaffold(),
};