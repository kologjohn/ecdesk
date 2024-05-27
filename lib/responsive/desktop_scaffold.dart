import 'dart:ui';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ndcdata/forms/login_form.dart';
import 'package:ndcdata/idcard.dart';
import 'package:ndcdata/route/routes.dart';
import 'package:ndcdata/widgets/qrcode_scanner.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:ndcdata/database/databases.dart';
import 'package:ndcdata/widgets/ff.dart';
import 'package:qr_bar_code_scanner_dialog/qr_bar_code_scanner_dialog.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '../database/regmodel.dart';
import '../widgets/sidebar_items.dart';
import '../widgets/totalvoterscard.dart';


class DesktopScaffold extends StatefulWidget {

  const DesktopScaffold({super.key});

  @override
  State<DesktopScaffold> createState() => _DesktopScaffoldState();
}

class _DesktopScaffoldState extends State<DesktopScaffold> {
  final _qrBarCodeScannerDialogPlugin = QrBarCodeScannerDialog();
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');


  final numformat = NumberFormat("#,##0.00", "en_US");
  final numformat1 = NumberFormat("#,##0", "en_US");
  List <String> regionlist=[];
  List <String> constlist=[];
  List <String> pslist=[];
  List  <Widget> carddata=[];
  List  <Widget> consdata=[];
  late List<double> maleline=[];
  late List<double> femaleline=[];
  List<BarChartGroupData> bardata=[];
  List<Widget> names=[];
  final searchcontroller=TextEditingController();

  int itemcount=0;
  int totalvoters=0;
  int totalmale=0;
  int totalfemale=0;
  List demoTilesd = [];
  List colors=[Colors.red, Colors.blue, Colors.green, Colors.grey, Colors.black, Colors.amber, Colors.lightBlue, Colors.purpleAccent, Colors.orangeAccent, Colors.cyan, Colors.deepOrange, Colors.deepPurple, Colors.purple, Colors.deepOrangeAccent, Colors.orange, Colors.deepPurpleAccent,];

  String? _selectedRegion;
  List<String> _regions = ['Upper East', 'Upper West', 'North East', 'Ahafo', 'Bono', 'Northern', 'Oti'];

  bool isSidebarExpanded = false;


  void toggleSidebar() {
    setState(() {
      isSidebarExpanded = !isSidebarExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Consumer<FirebaseAccounts>(
      builder: (BuildContext context, FirebaseAccounts value, Widget? child) {
        print(value.auth.currentUser);
       if(value.auth.currentUser==null){
          return LoginForm();
       }
        Size screenSize = MediaQuery.of(context).size;
        double screenWidth = screenSize.width;
        double screenHeight = screenSize.height;
        double cw=(screenWidth)*0.438;
        double scw=(screenWidth)*0.218;

        if(screenWidth <800){
          cw = screenWidth;
          scw = screenWidth;
        }

        else if(screenWidth >800 && screenWidth<880){
          scw = screenWidth*0.47;
        }


        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              centerTitle: true,
              toolbarHeight: 80,
              backgroundColor: Colors.green[900],
              title: Row(
                children: [
                  Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Wrap(
                              spacing: 5,
                              runSpacing: 5,
                              children: [
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    width: cw,
                                    child: const Text("NATIONAL DEMOCRATIC CONGRESS - EC DATABASE",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20
                                      ),
                                    ),
                                  ),
                                ),
                                FittedBox(
                                  fit: BoxFit.contain,
                                  child: Container(
                                    width: cw,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        // Expanded(
                                        //   child: Container(
                                        //       //height: 50,
                                        //       //width: 300,
                                        //       //color: Colors.white54,
                                        //     decoration: const BoxDecoration(
                                        //         border: Border(
                                        //           top: BorderSide(color: Colors.white),
                                        //           bottom: BorderSide(color: Colors.white),
                                        //           left: BorderSide(color: Colors.white),
                                        //           right: BorderSide(color: Colors.white),
                                        //         )
                                        //     ),
                                        //       child: Padding(
                                        //         padding: const EdgeInsets.only(left: 8.0),
                                        //         child: Row(
                                        //           children: [
                                        //             DropdownButton<String>(
                                        //               hint: const Text(
                                        //                   'Select Region',
                                        //                 style: TextStyle(
                                        //                   color: Colors.white
                                        //                 ),
                                        //               ),
                                        //               value: _selectedRegion,
                                        //               onChanged: (String? newValue) {
                                        //                 setState(() {
                                        //                   _selectedRegion = newValue;
                                        //                 });
                                        //               },
                                        //               items: _regions.map<DropdownMenuItem<String>>((String value) {
                                        //                 return DropdownMenuItem<String>(
                                        //                   value: value,
                                        //                   child: Text(value),
                                        //                 );
                                        //               }).toList(),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //       )
                                        //   ),
                                        // ),
                                        // const SizedBox(width: 8),
                                        Container(
                                          //height: 50,
                                          //width: 300,
                                          decoration: const BoxDecoration(
                                            //color: Colors.orange,
                                              borderRadius: BorderRadius.all(Radius.circular(10)),
                                              border: Border(
                                                top: BorderSide(color: Colors.white),
                                                bottom: BorderSide(color: Colors.white),
                                                left: BorderSide(color: Colors.white),
                                                right: BorderSide(color: Colors.white),
                                              )
                                          ),
                                          child:  Column(

                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(left: 8.0),
                                                child: Center(
                                                  child: FittedBox(
                                                    child: Container(
                                                      width: scw*0.9,
                                                      child:  TextField(

                                                        style: TextStyle(color:Colors.white),
                                                        controller: searchcontroller,
                                                        onChanged: (text){
                                                          value.desktoshow(text);
                                                          value.seearchifo(text);
                                                        },
                                                        decoration: InputDecoration(
                                                          suffixIcon: InkWell(
                                                              onTap: (){
                                                                _qrBarCodeScannerDialogPlugin.getScannedQrBarCode(
                                                                    context: context,
                                                                    onCode: (code) async{
                                                                      var newString = code!.substring(code!.length - 10);
                                                                      print(newString);
                                                                      searchcontroller.text=newString;
                                                                      value.desktoshow(newString);
                                                                      value.seearchifo(newString);
                                                                    });
                                                                // Navigator.push(
                                                                //   context,
                                                                //   MaterialPageRoute(builder: (context) => const QRViewExample()),
                                                                // );
                                                              },
                                                              child: Icon(Icons.qr_code)),
                                                          suffixIconColor: Colors.white,
                                                          hintText: 'Search...',
                                                          hintStyle: TextStyle(color: Colors.white54, fontSize: 12),
                                                          prefixIcon: Icon(Icons.search),
                                                          prefixIconColor: Colors.white,
                                                          fillColor: Colors.blue,
                                                          filled: false,
                                                          border: InputBorder.none,

                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                  )
                ],
              ),

            ),
            body:  Padding(
              padding: const EdgeInsets.only(right: 8.0, bottom: 8.0, top: 8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    width: isSidebarExpanded ? 200 : 70,
                    color: Colors.green[900],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            isSidebarExpanded ? Icons.arrow_back : Icons.arrow_forward,
                            color: Colors.white,
                          ),
                          onPressed: toggleSidebar,
                        ),
                        Expanded(
                          child: ListView(
                            children: <Widget>[
                              SidebarItem(
                                icon: Icons.home,
                                text: 'Home',
                                isExpanded: isSidebarExpanded,
                                onTap: () {  },
                                //svgPath: 'assets/svgs/home2.svg',
                              ),
                              SidebarItem(
                                icon: Icons.person,
                                text: 'Add User',
                                isExpanded: isSidebarExpanded,
                                onTap: () {  },
                                //svgPath: 'assets/svgs/adduser.svg',
                              ),
                              SidebarItem(
                                icon: Icons.settings,
                                text: 'Settings',
                                isExpanded: isSidebarExpanded,
                                onTap: () {  },
                                //svgPath: 'assets/svgs/sett.svg',
                              ),
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Divider(),
                        ),
                        SidebarItem(
                          icon: Icons.power_settings_new,
                          text: 'Log Out',
                          isExpanded: isSidebarExpanded,
                          onTap: () {
                            value.logout(context);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(builder: (context) => LoginForm()),
                            // );
                            //Navigator.pushNamed(context, Routes.login);
                            print("You logged out");
                          },
                          //svgPath: 'assets/svgs/logout.svg',
                        ),

                        SidebarItem(
                          icon: Icons.settings,
                          text: 'Settings',
                          isExpanded: isSidebarExpanded,
                          onTap: () {  },
                          //svgPath: 'assets/svgs/sett.svg',
                        ),
                      ],
                    ),
                  ),
                  //const DemoDrawer(),
                  Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: value.desktopshow,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Wrap(
                                                    spacing: 5,
                                                    runSpacing: 5,
                                                    children: [
                                                      FutureBuilder<RegionalSummaryResponse>(
                                                        future: value.fetchRegionalSummary(),
                                                        builder: (context, snapshot) {

                                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                                            return const Center(child: CircularProgressIndicator());
                                                          } else if (snapshot.hasError) {
                                                            return Center(child: Text('Error: ${snapshot.error} . Reload browser'));
                                                          } else if (snapshot.hasData) {
                                                            carddata.clear();
                                                            totalvoters=0;
                                                            totalfemale=0;
                                                            totalmale=0;
                                                            int datalength=snapshot.data!.regionalSummary.length;
                                                            for (int i=0; i<datalength; i++){
                                                              final summary = snapshot.data!.regionalSummary[i];
                                                              int mytotal=summary.totalVoters;
                                                              totalvoters+=mytotal;
                                                            }
                                                            for (int i=0; i<datalength; i++){
                                                              final summary = snapshot.data!.regionalSummary[i];
                                                              String code = summary.id;
                                                              String total =summary.totalVoters.toString();
                                                              String regionnames = summary.region;
                                                              int mytotal=summary.totalVoters;
                                                              int male=summary.male;
                                                              int female=summary.female;

                                                              totalmale+=male;
                                                              totalfemale+=female;
                                                              final per=numformat.format((mytotal/totalvoters)*(100));
                                                              //femaleline.add(FlSpot(double.parse("$i"), double.parse("$femaleline")));
                                                              //regionalcode.add(code);
                                                              // totals.add(total);
                                                              carddata.add(totalvoter(mycolors: colors[i], regionalcode: code, numformat1: numformat1, totals: total, totalper: "$per", regionName: regionnames,),);
                                                            }

                                                            return  Container(
                                                              height: 370,
                                                              width: cw,
                                                              decoration: BoxDecoration(
                                                                  color: Colors.green[900]?.withOpacity(0.2),
                                                                  borderRadius: const BorderRadius.all(Radius.circular(8))
                                                              ),
                                                              child: SingleChildScrollView(
                                                                scrollDirection: Axis.vertical,
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                  children: [
                                                                    const Text("Regional Summary", style: TextStyle(color: Colors.black),),
                                                                    Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      //crossAxisAlignment: CrossAxisAlignment.end,
                                                                      children: [
                                                                        const Icon(Icons.person),
                                                                        Text("${numformat1.format(totalvoters)}",
                                                                          style: const TextStyle(
                                                                            fontSize: 35,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: const EdgeInsets.all(4.0),
                                                                      child: Row(
                                                                        //mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: [
                                                                          Expanded(
                                                                              child: Center(
                                                                                child: Wrap(
                                                                                  spacing: 4,
                                                                                  runSpacing: 4,
                                                                                  children: carddata,
                                                                                ),
                                                                              )
                                                                          )
                                                                        ],
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          } else {
                                                            print("has data");
                                                            return const Center(child: Text('No data available'));
                                                          }
                                                        },
                                                      ),
                                                      // Container(
                                                      //   height: 370,
                                                      //   width: cw,
                                                      //   decoration: BoxDecoration(
                                                      //       color: Colors.green[900]?.withOpacity(0.2),
                                                      //       borderRadius: const BorderRadius.all(Radius.circular(8))
                                                      //   ),
                                                      //   child: SingleChildScrollView(
                                                      //       scrollDirection: Axis.vertical,
                                                      //     child: Column(
                                                      //       children: [
                                                      //         Text("Contituency Summary"),
                                                      //         Padding(
                                                      //           padding: EdgeInsets.all(8.0),
                                                      //           child: Row(
                                                      //             children: [
                                                      //               Expanded(
                                                      //                 //flex: 2,
                                                      //                 child: Center(
                                                      //                   child: Wrap(
                                                      //                     spacing: 5,
                                                      //                     runSpacing: 5,
                                                      //                     children: [
                                                      //                       for(int i=0; i<16; i++)
                                                      //                       ConstituencyCard(),
                                                      //                     ],
                                                      //                   ),
                                                      //                 ),
                                                      //               )
                                                      //             ],
                                                      //           ),
                                                      //         )
                                                      //       ],
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      FutureBuilder<AgereResponse>(
                                                        future: value.fetchAgeGroupData(),
                                                        builder: (context, snapshot) {
                                                          int xx=0;
                                                          List<int> dd=[];
                                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                                            return const Center(child: CircularProgressIndicator());
                                                          } else if (snapshot.hasError) {
                                                            return Center(child: Text('Error: ${snapshot.error}'));
                                                          } else if (snapshot.hasData) {

                                                            int datalength=snapshot.data!.agesuSummary.length;
                                                            bardata.clear();
                                                            for (int i=0; i<datalength; i++){
                                                              final summary = snapshot.data!.agesuSummary[i];
                                                              //print(summary.age_group);
                                                              double ff=double.parse("${summary.count}");
                                                              dd.add(summary.count);
                                                              bardata.add(
                                                                  BarChartGroupData(
                                                                    x: i,
                                                                    barRods: [
                                                                      BarChartRodData(toY: ff, color: Colors.green[900])
                                                                    ],
                                                                  )
                                                              );
                                                            }
                                                            int maxNumber = dd.reduce((a, b) => a > b ? a : b);

                                                            return Container(
                                                              height: 370,
                                                              width: cw,
                                                              decoration: BoxDecoration(
                                                                  color: Colors.green[900]?.withOpacity(0.2),
                                                                  borderRadius: const BorderRadius.all(Radius.circular(8))
                                                              ),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                children: [
                                                                  const Text("Age Distribution"),
                                                                  Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: SingleChildScrollView(
                                                                      scrollDirection: Axis.horizontal,
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                              height: 300,
                                                                              width: bardata.length * 60.0, // Adjust the width based on the number of bars
                                                                              child: BarChart(
                                                                                BarChartData(
                                                                                  alignment: BarChartAlignment.spaceAround,
                                                                                  maxY: double.parse("$maxNumber"),
                                                                                  barTouchData: BarTouchData(enabled: true),
                                                                                  titlesData: FlTitlesData(
                                                                                    leftTitles: AxisTitles(
                                                                                      sideTitles: SideTitles(
                                                                                        showTitles: true,
                                                                                        getTitlesWidget: (value, meta) {
                                                                                          return SideTitleWidget(
                                                                                            axisSide: meta.axisSide,
                                                                                            child: Text(value.toInt().toString(), style: TextStyle(color: Colors.black, fontSize: 14)),
                                                                                          );
                                                                                        },
                                                                                        reservedSize: 40,
                                                                                      ),
                                                                                    ),
                                                                                    bottomTitles: AxisTitles(
                                                                                      sideTitles: SideTitles(
                                                                                        showTitles: true,
                                                                                        getTitlesWidget: (value, meta) {
                                                                                          const style = TextStyle(
                                                                                            color: Colors.black,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontSize: 12,
                                                                                          );
                                                                                          switch (value) {
                                                                                            case 0:
                                                                                              return SideTitleWidget(child: Text('100+', style: style), axisSide: meta.axisSide);
                                                                                            case 1:
                                                                                              return SideTitleWidget(child: Text('18-24', style: style), axisSide: meta.axisSide);
                                                                                            case 2:
                                                                                              return SideTitleWidget(child: Text('25-31', style: style), axisSide: meta.axisSide);
                                                                                            case 3:
                                                                                              return SideTitleWidget(child: Text('32-38', style: style), axisSide: meta.axisSide);
                                                                                            case 4:
                                                                                              return SideTitleWidget(child: Text('39-45', style: style), axisSide: meta.axisSide);
                                                                                            case 5:
                                                                                              return SideTitleWidget(child: Text('46-52', style: style), axisSide: meta.axisSide);
                                                                                            case 6:
                                                                                              return SideTitleWidget(child: Text('53-59', style: style), axisSide: meta.axisSide);
                                                                                            case 7:
                                                                                              return SideTitleWidget(child: Text('60-66', style: style), axisSide: meta.axisSide);
                                                                                            case 8:
                                                                                              return SideTitleWidget(child: Text('67-73', style: style), axisSide: meta.axisSide);
                                                                                            case 9:
                                                                                              return SideTitleWidget(child: Text('74-80', style: style), axisSide: meta.axisSide);
                                                                                            case 10:
                                                                                              return SideTitleWidget(child: Text('81-87', style: style), axisSide: meta.axisSide);
                                                                                            case 11:
                                                                                              return SideTitleWidget(child: Text('88-94', style: style), axisSide: meta.axisSide);
                                                                                            case 12:
                                                                                              return SideTitleWidget(child: Text('95-101', style: style), axisSide: meta.axisSide);
                                                                                            default:
                                                                                              return SideTitleWidget(child: Text('', style: style), axisSide: meta.axisSide);
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  borderData: FlBorderData(show: true),
                                                                                  barGroups: bardata,
                                                                                ),
                                                                              )
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            );

                                                          } else {
                                                            //print("has data");
                                                            return const Center(child: Text('No data available'));
                                                          }
                                                        },
                                                      ),

                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: screenWidth*0.88,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.all(Radius.circular(8)),
                                        color: Colors.green[900]?.withOpacity(0.2),
                                      ),
                                      child: FutureBuilder<RegionalSummaryResponse>(
                                          future: value.fetchRegionalSummary(),
                                          builder: (context, snapshot) {
                                            Size screenSize = MediaQuery.of(context).size;
                                            double screenWidth = screenSize.width;
                                            double screenHeight = screenSize.height;
                                            double cw=250.0;
                                            double ch=100.0;
                                            double vpw=(cw/screenWidth);
                                            double vph=(ch/screenHeight);
                                            if(snapshot.hasData){
                                              for (var item in snapshot.data!.regionalSummary){
                                                int f= item.female;
                                                int m= item.male;
                                                int t= item.male+item.female;
                                                double malere=(m/t)*100;
                                                double femalere=(f/t)*100;

                                                String constituency= item.region;
                                                consdata.add(
                                                    Wrap(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets.all(2.0),
                                                          child: FittedBox(
                                                            fit: BoxFit.contain,
                                                            child: Container(
                                                              height: 100,
                                                              width: 250,
                                                              decoration: BoxDecoration(
                                                                  color: Colors.green[900]?.withOpacity(0.2),
                                                                  borderRadius: const BorderRadius.all(Radius.circular(8))
                                                              ),
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(8.0),
                                                                child: Column(
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    FittedBox(fit:BoxFit.contain,child: Text(constituency, style: const TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),
                                                                    Row(
                                                                      children: [
                                                                        const Icon(Icons.person,color: Colors.black12,),
                                                                        const Text("Female: "),
                                                                        Row(
                                                                          children: [
                                                                            Text(numformat.format(f), style: const TextStyle(fontSize: 12),),
                                                                            Text("~${numformat.format(femalere)}%", style:  TextStyle(fontSize: 12,color: Colors.cyan[800]),),

                                                                          ],
                                                                        ),

                                                                        // Text("${f}~${numformat.format(femalere)}%", style: const TextStyle(fontSize: 12),),
                                                                      ],
                                                                    ),
                                                                    Row(
                                                                      children: [
                                                                        const Icon(Icons.person,color: Colors.black12),
                                                                        const Text("Male: "),
                                                                        Row(
                                                                          children: [
                                                                            Text("${m}", style: const TextStyle(fontSize: 12),),
                                                                            Text("~${numformat.format(malere)}%", style:  TextStyle(fontSize: 12,color: Colors.cyan[800]),),

                                                                          ],
                                                                        )

                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ));
                                              }


                                            }
                                            return CarouselSlider(
                                                items: consdata,
                                                options: CarouselOptions(
                                                  autoPlay: true,
                                                  height: 100,
                                                  viewportFraction: vpw,
                                                  enlargeCenterPage: false,

                                                )
                                            );
                                          }
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Wrap(
                                                    spacing: 5,
                                                    runSpacing: 5,
                                                    children: [
                                                      Container(
                                                        height: 230,
                                                        width: scw,
                                                        decoration: BoxDecoration(
                                                            color: Colors.green[900]?.withOpacity(0.2),
                                                            borderRadius: const BorderRadius.all(Radius.circular(8))
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              FittedBox(
                                                                fit: BoxFit.contain,
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Container(
                                                                      height: 40,
                                                                      width: 40,
                                                                      decoration: BoxDecoration(
                                                                        shape: BoxShape.circle,
                                                                        color: Colors.purple[900],
                                                                      ),
                                                                    ),
                                                                    const SizedBox(width: 30),
                                                                    const Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text("EC Sex Errors Statistics"),
                                                                        Text("12,890"),
                                                                        Text("23%"),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(height: 20),
                                                              FittedBox(
                                                                fit: BoxFit.contain,
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Container(
                                                                      height: 40,
                                                                      width: 40,
                                                                      decoration: BoxDecoration(
                                                                        shape: BoxShape.circle,
                                                                        color: Colors.orange[900],
                                                                      ),
                                                                    ),
                                                                    const SizedBox(width: 30),
                                                                    const Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text("EC Age Errors Statistics"),
                                                                        Text("12,890"),
                                                                        Text("23%"),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        height: 230,
                                                        width: scw,
                                                        decoration: BoxDecoration(
                                                            color: Colors.green[900]?.withOpacity(0.2),
                                                            borderRadius: const BorderRadius.all(Radius.circular(8))
                                                        ),
                                                        child: SingleChildScrollView(
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [
                                                              const Text("Statistics"),
                                                              Wrap(
                                                                spacing: 10,
                                                                runSpacing: 10,
                                                                children: [
                                                                  //for(int i=0; i<4; i++)
                                                                  Container(
                                                                    height: 70,
                                                                    width: 170,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.black54.withOpacity(0.1),
                                                                        borderRadius: const BorderRadius.all(Radius.circular(8))
                                                                    ),
                                                                    child: Row(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                      children: [
                                                                        Column(
                                                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              height: 40,
                                                                              width: 40,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                                                                color: Colors.green[900],
                                                                              ),
                                                                              child: const Center(
                                                                                  child: Text(
                                                                                    "NDC",
                                                                                    style: TextStyle(
                                                                                        color: Colors.white,
                                                                                        fontWeight: FontWeight.bold
                                                                                    ),
                                                                                  )
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            Text("1,000,000"),
                                                                            Text("58%"),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: 70,
                                                                    width: 170,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.black54.withOpacity(0.1),
                                                                        borderRadius: const BorderRadius.all(Radius.circular(8))
                                                                    ),
                                                                    child: Row(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                      children: [
                                                                        Column(
                                                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              height: 40,
                                                                              width: 40,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                                                                color: Colors.blue[900],
                                                                              ),
                                                                              child: const Center(
                                                                                  child: Text(
                                                                                    "NPP",
                                                                                    style: TextStyle(
                                                                                        color: Colors.white,
                                                                                        fontWeight: FontWeight.bold
                                                                                    ),
                                                                                  )
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            Text("1,000,000"),
                                                                            Text("58%"),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: 70,
                                                                    width: 170,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.black54.withOpacity(0.1),
                                                                        borderRadius: const BorderRadius.all(Radius.circular(8))
                                                                    ),
                                                                    child: Row(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                      children: [
                                                                        Column(
                                                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              height: 40,
                                                                              width: 40,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                                                                color: Colors.grey[900],
                                                                              ),
                                                                              child: const Center(
                                                                                  child: Text(
                                                                                    "OT",
                                                                                    style: TextStyle(
                                                                                        color: Colors.white,
                                                                                        fontWeight: FontWeight.bold
                                                                                    ),
                                                                                  )
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            Text("1,000,000"),
                                                                            Text("58%"),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    height: 70,
                                                                    width: 170,
                                                                    decoration: BoxDecoration(
                                                                        color: Colors.black54.withOpacity(0.1),
                                                                        borderRadius: const BorderRadius.all(Radius.circular(8))
                                                                    ),
                                                                    child: Row(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                      children: [
                                                                        Column(
                                                                          //crossAxisAlignment: CrossAxisAlignment.start,
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            Container(
                                                                              height: 40,
                                                                              width: 40,
                                                                              decoration: BoxDecoration(
                                                                                borderRadius: const BorderRadius.all(Radius.circular(8)),
                                                                                color: Colors.red[900],
                                                                              ),
                                                                              child: const Center(
                                                                                  child: Text(
                                                                                    "FT",
                                                                                    style: TextStyle(
                                                                                        color: Colors.white,
                                                                                        fontWeight: FontWeight.bold
                                                                                    ),
                                                                                  )
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        const Column(
                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                                          children: [
                                                                            Text("1,000,000"),
                                                                            Text("58%"),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      FutureBuilder<RegionalSummaryResponse>(
                                                        future: value.fetchRegionalSummary(),
                                                        builder: (BuildContext context, AsyncSnapshot<RegionalSummaryResponse> snapshot) {
                                                          if(snapshot.hasData)
                                                          {
                                                            int datalength=snapshot.data!.regionalSummary.length;
                                                            totalmale=0;
                                                            totalfemale=0;
                                                            totalvoters=0;
                                                            for (int i=0; i<datalength; i++){
                                                              final summary = snapshot.data!.regionalSummary[i];
                                                              totalmale+=summary.male;
                                                              totalfemale+=summary.female;
                                                              totalvoters+=(summary.female+summary.male);
                                                            }
                                                            //return Text("data");
                                                          }
                                                          else if(snapshot.hasError){


                                                          }
                                                          else if(!snapshot.hasData){

                                                          }
                                                          return Container(
                                                            padding: const EdgeInsets.all(16.0),
                                                            height: 230,
                                                            width: scw,
                                                            decoration: BoxDecoration(
                                                                color: Colors.green[900]?.withOpacity(0.2),
                                                                borderRadius: const BorderRadius.all(Radius.circular(8))
                                                            ),
                                                            child: Column(
                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                              children: [
                                                                const Text(
                                                                  "Sex Distribution Chart",
                                                                  style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 14,
                                                                  ),
                                                                ),
                                                                const SizedBox(height: 15,),
                                                                SizedBox(
                                                                  height: 130,
                                                                  child: Stack(
                                                                    children: [
                                                                      PieChart(
                                                                          PieChartData(
                                                                              sections: [
                                                                                PieChartSectionData(
                                                                                    value: double.parse("$totalmale"),
                                                                                    color: Colors.green[900],
                                                                                    showTitle: false,
                                                                                    radius: 15
                                                                                ),
                                                                                PieChartSectionData(
                                                                                    value: double.parse("$totalfemale"),
                                                                                    color: Colors.orange,
                                                                                    showTitle: false,
                                                                                    radius: 10
                                                                                ),
                                                                              ]
                                                                          )
                                                                      ),
                                                                      Positioned.fill(
                                                                          child: Column(
                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                "${numformat1.format(totalvoters)}",
                                                                                // style: Theme.of(context)
                                                                                //     .textTheme
                                                                                //     .headline4?.copyWith(
                                                                                //     color: Colors.black54,
                                                                                //     fontWeight: FontWeight.w600,
                                                                                //     fontSize: 12
                                                                                // ),
                                                                              ),
                                                                              const Text(
                                                                                "Total",
                                                                                style: TextStyle(
                                                                                    color: Colors.black54
                                                                                ),
                                                                              )
                                                                            ],
                                                                          )
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                const SizedBox(height: 10,),
                                                                Expanded(
                                                                  child: FittedBox(
                                                                    child: Row(
                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Container(
                                                                              height: 10,
                                                                              width: 10,
                                                                              color: Colors.green[900],
                                                                            ),
                                                                            const SizedBox(width: 8),
                                                                            Text("Male ${numformat1.format(totalmale)}")
                                                                          ],
                                                                        ),
                                                                        const SizedBox(width: 40,),
                                                                        Row(
                                                                          children: [
                                                                            Container(
                                                                              height: 10,
                                                                              width: 10,
                                                                              color: Colors.orange,
                                                                            ),
                                                                            const SizedBox(width: 8),
                                                                            Text("Female ${numformat1.format(totalfemale)}")
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                          );

                                                        },
                                                      ),
                                                      Container(
                                                        height: 230,
                                                        width: scw,
                                                        decoration: BoxDecoration(
                                                            color: Colors.green[900]?.withOpacity(0.2),
                                                            borderRadius: const BorderRadius.all(Radius.circular(8))
                                                        ),
                                                        child: Padding(
                                                          padding: const EdgeInsets.all(8.0),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                            children: [
                                                              FittedBox(
                                                                fit: BoxFit.contain,
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Container(
                                                                      height: 40,
                                                                      width: 40,
                                                                      decoration: BoxDecoration(
                                                                        shape: BoxShape.circle,
                                                                        color: Colors.blue[900],
                                                                      ),
                                                                    ),
                                                                    const SizedBox(width: 30),
                                                                    const Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text("EC Sex Errors Statistics"),
                                                                        Text("12,890"),
                                                                        Text("23%"),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                              const SizedBox(height: 20),
                                                              FittedBox(
                                                                fit: BoxFit.contain,
                                                                child: Row(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  children: [
                                                                    Container(
                                                                      height: 40,
                                                                      width: 40,
                                                                      decoration: BoxDecoration(
                                                                        shape: BoxShape.circle,
                                                                        color: Colors.green[900],
                                                                      ),
                                                                    ),
                                                                    const SizedBox(width: 30),
                                                                    const Column(
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Text("EC Age Errors Statistics"),
                                                                        Text("12,890"),
                                                                        Text("23%"),
                                                                      ],
                                                                    )
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Expanded(
                                            child: Container(
                                              child: Column(
                                                children: [
                                                  Wrap(
                                                    spacing: 5,
                                                    runSpacing: 5,
                                                    children: [
                                                      FutureBuilder<AgereResponse>(
                                                        future: value.fetchAgeGroupData(),
                                                        builder: (context, snapshot) {
                                                          int xx=0;
                                                          List<int> dd=[];
                                                          if (snapshot.connectionState == ConnectionState.waiting) {
                                                            return const Center(child: CircularProgressIndicator());
                                                          } else if (snapshot.hasError) {
                                                            return Center(child: Text('Error: ${snapshot.error}'));
                                                          } else if (snapshot.hasData) {

                                                            int datalength=snapshot.data!.agesuSummary.length;
                                                            bardata.clear();
                                                            for (int i=0; i<datalength; i++){
                                                              final summary = snapshot.data!.agesuSummary[i];
                                                              //print(summary.age_group);
                                                              double ff=double.parse("${summary.count}");
                                                              dd.add(summary.count);
                                                              bardata.add(
                                                                  BarChartGroupData(
                                                                    x: i,
                                                                    barRods: [
                                                                      BarChartRodData(toY: ff, color: Colors.green[900])
                                                                    ],
                                                                  )
                                                              );
                                                            }
                                                            int maxNumber = dd.reduce((a, b) => a > b ? a : b);

                                                            return Container(
                                                              height: 700,
                                                              width: cw,
                                                              decoration: BoxDecoration(
                                                                  color: Colors.green[900]?.withOpacity(0.2),
                                                                  borderRadius: const BorderRadius.all(Radius.circular(8))
                                                              ),
                                                              child: Column(
                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                children: [
                                                                  Padding(
                                                                    padding: const EdgeInsets.all(8.0),
                                                                    child: SingleChildScrollView(
                                                                      scrollDirection: Axis.horizontal,
                                                                      child: Row(
                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Container(
                                                                              height: 650,
                                                                              width: bardata.length * 60.0,
                                                                              child: BarChart(
                                                                                BarChartData(
                                                                                  alignment: BarChartAlignment.spaceAround,
                                                                                  maxY: double.parse("$maxNumber"),
                                                                                  barTouchData: BarTouchData(enabled: true),
                                                                                  titlesData: FlTitlesData(
                                                                                    leftTitles: AxisTitles(
                                                                                      sideTitles: SideTitles(
                                                                                        showTitles: true,
                                                                                        getTitlesWidget: (value, meta) {
                                                                                          return SideTitleWidget(
                                                                                            axisSide: meta.axisSide,
                                                                                            child: Text(value.toInt().toString(), style: TextStyle(color: Colors.black, fontSize: 14)),
                                                                                          );
                                                                                        },
                                                                                        reservedSize: 40,
                                                                                      ),
                                                                                    ),
                                                                                    bottomTitles: AxisTitles(
                                                                                      sideTitles: SideTitles(
                                                                                        showTitles: true,
                                                                                        getTitlesWidget: (value, meta) {
                                                                                          const style = TextStyle(
                                                                                            color: Colors.black,
                                                                                            fontWeight: FontWeight.bold,
                                                                                            fontSize: 12,
                                                                                          );
                                                                                          switch (value) {
                                                                                            case 0:
                                                                                              return SideTitleWidget(child: Text('100+', style: style), axisSide: meta.axisSide);
                                                                                            case 1:
                                                                                              return SideTitleWidget(child: Text('18-24', style: style), axisSide: meta.axisSide);
                                                                                            case 2:
                                                                                              return SideTitleWidget(child: Text('25-31', style: style), axisSide: meta.axisSide);
                                                                                            case 3:
                                                                                              return SideTitleWidget(child: Text('32-38', style: style), axisSide: meta.axisSide);
                                                                                            case 4:
                                                                                              return SideTitleWidget(child: Text('39-45', style: style), axisSide: meta.axisSide);
                                                                                            case 5:
                                                                                              return SideTitleWidget(child: Text('46-52', style: style), axisSide: meta.axisSide);
                                                                                            case 6:
                                                                                              return SideTitleWidget(child: Text('53-59', style: style), axisSide: meta.axisSide);
                                                                                            case 7:
                                                                                              return SideTitleWidget(child: Text('60-66', style: style), axisSide: meta.axisSide);
                                                                                            case 8:
                                                                                              return SideTitleWidget(child: Text('67-73', style: style), axisSide: meta.axisSide);
                                                                                            case 9:
                                                                                              return SideTitleWidget(child: Text('74-80', style: style), axisSide: meta.axisSide);
                                                                                            case 10:
                                                                                              return SideTitleWidget(child: Text('81-87', style: style), axisSide: meta.axisSide);
                                                                                            case 11:
                                                                                              return SideTitleWidget(child: Text('88-94', style: style), axisSide: meta.axisSide);
                                                                                            case 12:
                                                                                              return SideTitleWidget(child: Text('95-101', style: style), axisSide: meta.axisSide);
                                                                                            default:
                                                                                              return SideTitleWidget(child: Text('', style: style), axisSide: meta.axisSide);
                                                                                          }
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  borderData: FlBorderData(show: true),
                                                                                  barGroups: bardata,
                                                                                ),
                                                                              )
                                                                          )
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            );

                                                          } else {
                                                            //print("has data");
                                                            return const Center(child: Text('No data available'));
                                                          }
                                                        },
                                                      ),
                                                      // Container(
                                                      //   height: 700,
                                                      //   width: cw,
                                                      //   decoration: BoxDecoration(
                                                      //       color: Colors.green[900]?.withOpacity(0.2),
                                                      //       borderRadius: const BorderRadius.all(Radius.circular(8))
                                                      //   ),
                                                      //   child: Padding(
                                                      //     padding: const EdgeInsets.all(30.0),
                                                      //     child: SimpleBarChart(),
                                                      //   ),
                                                      // ),
                                                      FutureBuilder<RegionalSummaryResponse>(
                                                        future: value.fetchRegionalSummary(),
                                                        builder: (BuildContext context, AsyncSnapshot<RegionalSummaryResponse> snapshot) {
                                                          if (snapshot.hasData) {
                                                            int datalength = snapshot.data!.regionalSummary.length;
                                                            maleline.clear();
                                                            femaleline.clear();
                                                            for (int i = 0; i < datalength; i++) {
                                                              final summary = snapshot.data!.regionalSummary[i];
                                                              int male = summary.male;
                                                              int female = summary.female;
                                                              maleline.add(double.parse("$male"));
                                                              femaleline.add(double.parse("$female"));
                                                            }
                                                          }
                                                          return Container(
                                                            height: 700,
                                                            width: cw,
                                                            decoration: BoxDecoration(
                                                              color: Colors.green[900]?.withOpacity(0.2),
                                                              borderRadius: const BorderRadius.all(Radius.circular(8)),
                                                            ),
                                                            child: SingleChildScrollView(
                                                              scrollDirection: Axis.horizontal,
                                                              child: Padding(
                                                                padding: const EdgeInsets.all(30.0),
                                                                child: Container(
                                                                  width: femaleline.length * 47.5,
                                                                  child: LineChart(
                                                                    LineChartData(
                                                                      lineBarsData: [
                                                                        LineChartBarData(
                                                                          spots: [
                                                                            for (int i = 0; i < femaleline.length; i++)
                                                                              FlSpot(double.parse("$i"), femaleline[i])
                                                                          ],
                                                                          isCurved: true,
                                                                          color: Colors.blue,
                                                                          barWidth: 2,
                                                                          isStrokeCapRound: true,
                                                                          dotData: FlDotData(show: false),
                                                                          belowBarData: BarAreaData(show: false),
                                                                        ),
                                                                        LineChartBarData(
                                                                          spots: [
                                                                            for (int i = 0; i < maleline.length; i++)
                                                                              FlSpot(double.parse("$i"), maleline[i])
                                                                          ],
                                                                          isCurved: true,
                                                                          color: Colors.green,
                                                                          barWidth: 2,
                                                                          isStrokeCapRound: true,
                                                                          dotData: FlDotData(show: false),
                                                                          belowBarData: BarAreaData(show: false),
                                                                        ),
                                                                      ],
                                                                      minY: 0,
                                                                      titlesData: FlTitlesData(
                                                                        bottomTitles: AxisTitles(
                                                                          sideTitles: SideTitles(
                                                                            showTitles: true,
                                                                            reservedSize: 30,
                                                                            getTitlesWidget: (value, meta) {
                                                                              const style = TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 14,
                                                                              );
                                                                              switch (value) {
                                                                                case 0:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(message: "WESTERN", child: Text('A', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                case 1:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(message: "CENTRAL", child: Text('B', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                case 2:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(message: "GREATER ACCRA", child: Text('C', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                case 3:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(message: "VOLTA", child: Text('D', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                case 4:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(message: "EASTERN", child: Text('E', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                case 5:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(message: "ASHANTI", child: Text('F', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                case 6:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(message: "WESTERN NORTH", child: Text('G', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                case 7:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(message: "AHAFO", child: Text('H', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                case 8:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(message: "BONO", child: Text('J', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                case 9:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(message: "BONO EAST", child: Text('K', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                case 10:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(message: "OTI", child: Text('L', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                case 11:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(message: "NORTHERN ", child: Text('M', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                case 12:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(message: "SAVANNAH ", child: Text('N', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                case 13:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(message: "UPPER WEST", child: Text('P', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                case 14:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(message: "NORTH EAST", child: Text('Q', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                case 15:
                                                                                  return SideTitleWidget(
                                                                                      child: Tooltip(preferBelow: false, message: "UPPER EAST", child: Text('R', style: style)),
                                                                                      axisSide: meta.axisSide);
                                                                                default:
                                                                                  return SideTitleWidget(
                                                                                      child: Text('---', style: style), axisSide: meta.axisSide);
                                                                              }
                                                                            },
                                                                          ),
                                                                        ),
                                                                        leftTitles: AxisTitles(
                                                                          sideTitles: SideTitles(
                                                                            showTitles: true,
                                                                            getTitlesWidget: (value, meta) {
                                                                              return SideTitleWidget(
                                                                                space: 5,
                                                                                axisSide: meta.axisSide,
                                                                                child: Text('$value', style: TextStyle(color: Colors.black, fontSize: 12)),
                                                                              );
                                                                            },
                                                                            reservedSize: 40,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      gridData: FlGridData(show: true),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            )
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                              visible: value.idshow,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: FutureBuilder<SearchSummaryResponse>(
                                          future: value.fetchSearch(searchcontroller.text),
                                          builder: (BuildContext context, AsyncSnapshot<SearchSummaryResponse> snapshot) {
                                            if(snapshot.hasData){
                                              int datalength=snapshot.data!.searchSummary.length;
                                              print(datalength);
                                              names.clear();
                                              for (int i=0; i<datalength; i++){
                                                final summary = snapshot.data!.searchSummary[i];
                                                String _name=summary.name;
                                                String _voterid=summary.voterid;
                                                String _sex=summary.sex;
                                                String _pscode=summary.pscode;
                                                String _image=summary.image;
                                                String _region=summary.region;
                                                String _constituency=summary.constituency;
                                                String _psname=summary.psname;
                                                int _age=summary.age;
                                                print(summary.image);
                                                names.add(Contents(name: summary.name, age: _age, voterid: _voterid, pscode: _pscode, sex: _sex, image: _image, constituency: _constituency, region: _region, psname: _psname,));
                                              }
                                              if (names.length ==0)
                                              {
                                                names.add(Container(
                                                  child: const Column(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.error_outline,
                                                        color: Colors.red,
                                                        size: 100,
                                                      ),
                                                      SizedBox(height: 16),
                                                      Text(
                                                        '404 - Search Not Found',
                                                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                                                      ),
                                                      SizedBox(height: 16),
                                                      Text(
                                                        'Your search does not exist.',
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(fontSize: 16),
                                                      ),
                                                    ],
                                                  ),
                                                ));
                                              }
                                            }
                                            else if(snapshot.hasError){
                                              print(snapshot.error);
                                            }
                                            else if(snapshot.hasError){
                                              print(snapshot.error);
                                            }
                                            else
                                            {
                                              print("No Data");
                                            }
                                            return  Container(
                                              child: Column(
                                                children: [
                                                  Wrap(
                                                      spacing: 5,
                                                      runSpacing: 5,
                                                      children: names
                                                  )
                                                ],
                                              ),
                                            );

                                          },
                                        )
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                  ),
                  //LineChart(LineChartData())
                ],
              ),
            )
        );
      },
    );
  }
}
