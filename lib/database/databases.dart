import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ndcdata/constant.dart';
import 'package:ndcdata/database/regmodel.dart';
import 'package:ndcdata/responsive/desktop_scaffold.dart';
import 'package:ndcdata/route/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAccounts extends ChangeNotifier{
 final db=FirebaseFirestore.instance;
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
 bool isLetter(String ch) {
   return (ch.codeUnitAt(0) >= 65 && ch.codeUnitAt(0) <= 90) || // A-Z
       (ch.codeUnitAt(0) >= 97 && ch.codeUnitAt(0) <= 122);  // a-z
 }
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
 //  print(returnbbool);
   notifyListeners();
 }

  initial(BuildContext context){
     if(auth.currentUser!=null){
       Navigator.pushReplacementNamed(context, Routes.login);
     }
     else
       {
         Navigator.pushReplacementNamed(context, Routes.dashboard);

       }
  }
  login(String phone,String password,BuildContext ctx)async{
    try{
      if(auth.currentUser!=null)
        {
          error="login already";
          Navigator.pushReplacementNamed(ctx, Routes.dashboard);
        }
      else
        {
           await auth.signInWithEmailAndPassword(email: "$phone$domain", password: password);
          if(auth.currentUser!=null){

            Navigator.pushReplacementNamed(ctx, Routes.dashboard);
            //Navigator.of(context).pushReplacementNamed('/login');
            error="";
    }
        }
    }on FirebaseException catch(e){
      error=e.message!;
    }
  notifyListeners();
  }
  logout(BuildContext ctx)async{
    try{
        auth.signOut();
       Navigator.pushReplacementNamed(ctx, Routes.login);
        } catch(e){
     // print(e);
    }

  }

  createaccount(String phone,String password,String pscode,String constituency,String region)async{
   try{
       final ff=await auth.createUserWithEmailAndPassword(email: "$phone$domain", password: password);
       if(auth.currentUser!=null){
        // print("Login successfully");
     }
   }on Exception catch(e){
     print(e);
   }

 }


 Future<AgereResponse> fetchAgeGroupData() async {
  //  await login();
    if(auth.currentUser!=null)
      {
        String? email = auth.currentUser!.email;
        final user = auth.currentUser;
        email ="";
        String? token = await user!.getIdToken();
      //  print(token);

        var headers = {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        };
        var request = http.Request('POST', Uri.parse('https://us-central1-ecdata-eb3b2.cloudfunctions.net/ages'));
        request.body = json.encode({
          "data": {
            "email": email,
          }
        });
        request.headers.addAll(headers);
        http.StreamedResponse response = await request.send();
        if (response.statusCode == 200) {
          String resdata = await response.stream.bytesToString();
          final Map parsed = json.decode(resdata);
          final  finaldata = parsed['result'];
          final a=jsonEncode(finaldata);
          //print(a);
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
     if(auth.currentUser!=null)
       {
         String? email = "";
         //login();
         final user = auth.currentUser;
         email ="";
         String? token = await user!.getIdToken();
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
     if(auth.currentUser!=null)
       {
         String? email = "";
         //login();
         final user = auth.currentUser;
         email ="";
         String? token = await user!.getIdToken();
         var headers = {
           'Content-Type': 'application/json',
           'Authorization': 'Bearer $token',
         };
         var request = http.Request('POST', Uri.parse('https://us-central1-ecdata-eb3b2.cloudfunctions.net/psearch'));
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
