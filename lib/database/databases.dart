import 'dart:convert';
import 'package:ecdesk/constant.dart';
import 'package:ecdesk/database/regmodel.dart';
import 'package:ecdesk/responsive/desktop_scaffold.dart';
import 'package:ecdesk/route/routes.dart';
import 'package:firedart/auth/exceptions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:firedart/firedart.dart';

class FirebaseAccounts extends ChangeNotifier{
 static final db=Firestore.instance;
  final auth=FirebaseAuth.instance;
  int numofregions=0;
  List<String> namelist=[];
  List<String> imageurllist=[];
  List<dynamic> voteragelist=[];
  List<dynamic> voteridlist=[];
  List<String> sexlist=[];
  List<dynamic> member=[];
  String memberstatus="";
  int male=0;
  String region_access="";
  String cons_access="";
  String pscode_access="";
  bool recordexist=false;
  bool saved=false;
  String error="";
  bool desktopshow=true;
  bool idshow=false;


   seearchifo(String startseach){
    if(startseach.length>0)
      {
        idshow=true;
      }
    else
      {
        idshow=true;
      }
    notifyListeners();
  }


  desktoshow(String startseach){
   bool returnbbool=false;
   if(startseach.length>0)
   {
     desktopshow=false;
   }
   else
   {
     desktopshow=true;
   }
   print(returnbbool);
   notifyListeners();
 }

  initial(BuildContext context){
     if(!auth.isSignedIn){
       Navigator.pushReplacementNamed(context, Routes.login);
     }
     else
       {
         Navigator.pushReplacementNamed(context, Routes.dashboard);

       }
  }
  login(String phone,String password,BuildContext ctx)async{
    try{
      if(auth.isSignedIn)
        {
          error="login already";
        }
      else
        {
           await auth.signIn("$phone$domain", password);
          if(auth.isSignedIn){
            Navigator.pushReplacementNamed(ctx, Routes.dashboard);
            //Navigator.of(context).pushReplacementNamed('/login');
            error="";
    }
        }
    }on AuthException catch(e){
      error=e.message;
    }
  notifyListeners();
  }
  logout(BuildContext ctx)async{
    try{
        auth.signOut();
       Navigator.pushReplacementNamed(ctx, Routes.login);
        } catch(e){
      print(e);
    }

  }

  createaccount(String phone,String password,String pscode,String constituency,String region)async{
   try{
       final ff=await auth.signUp("$phone$domain", password);
       if(auth.isSignedIn){
         print("Login successfully");
     }
   }on Exception catch(e){
     print(e);
   }

 }


 Future<AgereResponse> fetchAgeGroupData() async {
  //  await login();
    if(auth.isSignedIn)
      {
        String? email = "";
        final user = auth.getUser();
        email ="";
        String? token = await auth.tokenProvider.idToken;
        var headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };
        var request = http.Request('POST', Uri.parse('https://us-central1-ecdata-eb3b2.cloudfunctions.net/ages'));
        request.body = json.encode({
          "data": {
            "email": "email",
          }
        });
        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          String resdata = await response.stream.bytesToString();
          final Map parsed = json.decode(resdata);
          final  finaldata = parsed['result'];
          final a=jsonEncode(finaldata);
          print(a);
          return AgereResponse.fromJson(jsonDecode(a));
        } else {
          throw Exception('Failed to load data');
        }
      }else
        {
          notifyListeners();
          throw Exception('authentication...');
    }

 }

   Future<RegionalSummaryResponse> fetchRegionalSummary() async {
    //await login();
     if(auth.isSignedIn)
       {
         String? email = "";
         //login();
         final user = auth.getUser();
         email ="";
         String? token = await auth.tokenProvider.idToken;
         var headers = {
           'Content-Type': 'application/json',
           'Authorization': 'Bearer $token',
         };
         var request = http.Request('POST', Uri.parse('https://us-central1-ecdata-eb3b2.cloudfunctions.net/getRegionalSummary'));
         request.body = json.encode({
           "data": {
             "email": "email",
           }
         });
         request.headers.addAll(headers);
         http.StreamedResponse response = await request.send();

         //final response = await http.post(Uri.parse('https://us-central1-ecdata-eb3b2.cloudfunctions.net/getRegionalSummary'));

         if (response.statusCode == 200) {
           // If the server returns an OK response, parse the JSON
           String resdata = await response.stream.bytesToString();
           final Map parsed = json.decode(resdata);
           final  finaldata = parsed['result'];
           final a=jsonEncode(finaldata);

           return RegionalSummaryResponse.fromJson(jsonDecode(a));
         } else {
           // If the server did not return an OK response, throw an exception
           throw Exception('Failed to load regional summary');
         }}
         else
           {
             error="authenticating...";
             notifyListeners();
             throw Exception('Error Loading data');

           }

 }
   Future<SearchSummaryResponse> fetchSearch(String searchTxt) async {
   // await login();
     if(auth.isSignedIn)
       {
         String? email = "";
         //login();
         final user = auth.getUser();
         email ="";
         String? token = await auth.tokenProvider.idToken;
         var headers = {
           'Content-Type': 'application/json',
           'Authorization': 'Bearer $token',
         };
         var request = http.Request('POST', Uri.parse('https://us-central1-ecdata-eb3b2.cloudfunctions.net/search'));
         request.body = json.encode({
           "data": {
             "q": searchTxt,
           }
         });
         request.headers.addAll(headers);
         http.StreamedResponse response = await request.send();
         if (response.statusCode == 200) {
           // If the server returns an OK response, parse the JSON
           String resdata = await response.stream.bytesToString();
           final Map parsed = json.decode(resdata);
           final  finaldata = parsed['result'];
           final a=jsonEncode(finaldata);
           print(a);

           return SearchSummaryResponse.fromJson(jsonDecode(a));
         } else {
           // If the server did not return an OK response, throw an exception
           throw Exception('Failed to load regional summary');
         }}
         else
           {
             error="authenticating...";
             notifyListeners();
             throw Exception('Error Loading data');
           }

 }
}
