import 'dart:convert';
import 'dart:io';
import 'package:ecdesk/forms/login_form.dart';
import 'package:ecdesk/route/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:ecdesk/database/databases.dart';
import 'package:ecdesk/responsive/desktop_scaffold.dart';
import 'package:ecdesk/responsive/responsive_layout.dart';
import 'firebase_options.dart';
import 'package:firedart/firedart.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String keys="AIzaSyBSVeEDy4oZGkqTY7pYWvsJz6Cm-O1HPGo";
  String logintxt;

  FirebaseAuth.initialize(keys, VolatileStore());
  Firestore.initialize('ecdata-eb3b2');
  if(FirebaseAccounts().auth.isSignedIn)
  {
    logintxt=Routes.dashboard;
  }
  else
  {
    logintxt=Routes.login;
  }
  runApp(MyApp(flogin: logintxt,));
}

class MyApp extends StatelessWidget {
  String flogin;
    MyApp({super.key,required this.flogin});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      lazy: false,
      create: (BuildContext context)=>FirebaseAccounts(),
      child:  MaterialApp(
        initialRoute: flogin,
        routes: pages,
        title: 'EC-DATA CENTER',
        debugShowCheckedModeBanner: false,

        home:LoginForm() ,//ResponsiveLayout(mobileScaffold: DesktopScaffold(), tabletScaffold: DesktopScaffold(), desktopScaffold: DesktopScaffold()),
      ),
    );
  }
}
