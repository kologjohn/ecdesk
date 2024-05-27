import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:ndcdata/forms/login_form.dart';
import 'package:ndcdata/route/routes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ndcdata/database/databases.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  String initial="";
  if(FirebaseAccounts().auth.currentUser!=null){
    initial=Routes.dashboard;
  }
  else
    {
      initial=Routes.login;
    }
  runApp(MyApp(initlogin: initial,));
}

class MyApp extends StatelessWidget {
  String initlogin;
    MyApp({super.key,required this.initlogin});

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      lazy: false,
      create: (BuildContext context)=>FirebaseAccounts(),
      child:  MaterialApp(
        initialRoute: initlogin,
        routes: pages,
        title: 'EC-DATA CENTER',
        debugShowCheckedModeBanner: false,

        home:LoginForm() ,//ResponsiveLayout(mobileScaffold: DesktopScaffold(), tabletScaffold: DesktopScaffold(), desktopScaffold: DesktopScaffold()),
      ),
    );
  }
}
