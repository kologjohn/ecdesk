import 'package:ndcdata/forms/login_form.dart';
import 'package:ndcdata/responsive/desktop_scaffold.dart';
import 'package:ndcdata/widgets/qrcode_scanner.dart';

import '../widgets/new_info.dart';

class Routes{
  static String qrcode="qrcode";
  static String login="login";
  static String dashboard="dashboard";
  static String survey="survey";
}

final pages={
  Routes.qrcode:(context)=>const QRViewExample(),
  Routes.login:(context)=> LoginForm(),
  Routes.dashboard:(context)=> const DesktopScaffold(),
  Routes.survey:(context)=> DetailsInfo(),
};