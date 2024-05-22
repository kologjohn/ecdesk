import 'dart:convert';
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
  FirebaseAuth.initialize('AIzaSyBSVeEDy4oZGkqTY7pYWvsJz6Cm-O1HPGo', VolatileStore());
  Firestore.initialize('ecdata-eb3b2');
  //await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // if(kIsWeb){
  //   BrowserContextMenu.disableContextMenu();
  // }
  //
  // var headers = {
  //   'name': '50',
  //   'age': '50',
  //   'Content-Type': 'application/json',
  //   'Authorization': 'Bearer sk_live_bc5f5f79fb663941f1783271a3549e40abf31f79'
  // };
  // var request = http.Request('POST', Uri.parse('http://192.168.8.119:8700/postme'));
  // request.body = json.encode({"name": "Abi", "age": 30});
  // request.headers.addAll(headers);
  //
  // http.StreamedResponse response = await request.send();
  //
  // if (response.statusCode == 200) {
  //   print(await response.stream.bytesToString());
  // }
  // else {
  //   print(response.reasonPhrase);
  // }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    // TODO: implement initState
    FirebaseAccounts().login();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      lazy: false,
      create: (BuildContext context)=>FirebaseAccounts(),
      child: const MaterialApp(
        title: 'EC-DATA CENTER',
        debugShowCheckedModeBanner: false,
        home: ResponsiveLayout(mobileScaffold: DesktopScaffold(), tabletScaffold: DesktopScaffold(), desktopScaffold: DesktopScaffold()),
      ),
    );
  }
}
