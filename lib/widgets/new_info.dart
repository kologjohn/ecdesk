// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:image_network/image_network.dart';
import 'package:provider/provider.dart';

import '../database/databases.dart';
import '../global_colors.dart';


class DetailsInfo extends StatefulWidget {
  const DetailsInfo({super.key});

  @override
  State<DetailsInfo> createState() => _DetailsInfoState();
}

class _DetailsInfoState extends State<DetailsInfo> {
  String region="";
  // List regionlist=["Yambalga Joseph Yinbey","Samuel","Joe","Dan","Samuel","Joe","Dan","Samuel","Joe","Dan","Samuel","Joe"];
  // List myage=["23","34","55","34","23","34","55","34","23","34","55"];
  // List myimageurl=[my_image,my_image,my_image,my_image,my_image,my_image,my_image,my_image,my_image,my_image,my_image,my_image,];
  // String name="";

  List<Widget> show=[];
  List<String> names=[];
  List<Widget> myimage=[];
  List<Widget> ptimage=[];
  List<Widget> ages=[];
  List<Widget> sexwidget=[];
  List<Widget> voteidwidget=[];
  List<dynamic> member=[];
  List <String> voteridlist=[];

  int itemcount=0;
  String? regcode;


  dynamic groupValue="Yes";
  bool isVisible = true;

  List<String> filteredItems=[];
  TextEditingController searchController = TextEditingController();


  @override
  void initState() {
    super.initState();
    filteredItems = names;
    searchController.addListener(() {
      filterItems();
    });
  }

  void filterItems() {
    List<String> tempItems = [];
    if (searchController.text.isNotEmpty) {
      tempItems = names
          .where((item) =>
          item.toLowerCase().contains(searchController.text.toLowerCase()))
          .toList();
    } else {
      tempItems = names;
    }
    setState(() {
      filteredItems = tempItems;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // Define the item width
    double itemWidth = 280.0;
    // Calculate the crossAxisCount dynamically
    int crossAxisCount = (screenWidth / itemWidth).floor();
    if(crossAxisCount<=1){
      crossAxisCount=1;
    }
    return Consumer<FirebaseAccounts>(builder: (BuildContext context, FirebaseAccounts fbaccount, Widget? child) {
      //fbaccount.getSessionAccess();
      region=fbaccount.region_access;

      return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          toolbarHeight: 100,
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
                                width: 600,
                                child: Text(
                                  "$region VOTER'S PHOTO ALBUM",
                                  style: Global.normalsize,
                                ),
                              ),
                            ),
                            FittedBox(
                              fit: BoxFit.contain,
                              child: Container(
                                width: 500,
                                child: SizedBox(
                                  width: 400,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
                                    child: TextField(
                                      style: const TextStyle(color: Colors.white),
                                      controller: searchController,
                                      decoration: InputDecoration(
                                          prefixIcon: const Icon(Icons.search),
                                          prefixIconColor: Colors.white54,
                                          hintText: "Search...",
                                          hintStyle: const TextStyle(color: Colors.white54),
                                          focusedBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.white,
                                              )
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey.shade600
                                              )
                                          )
                                      ),
                                    ),
                                  ),
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
        // appBar: AppBar(
        //   backgroundColor: Colors.black,
        //   toolbarHeight: 100,
        //   title: Row(
        //     children: [
        //       Expanded(
        //           child: Container(
        //             child: Column(
        //               children: [
        //                 Wrap(
        //                   children: [
        //                     Padding(
        //                       padding: EdgeInsets.all(8.0),
        //                       child: Text(
        //                         "$region VOTER'S PHOTO ALBUM",
        //                         style: Global.normalsize,
        //                       ),
        //                     ),
        //                     SizedBox(
        //                       width: 400,
        //                       child: Padding(
        //                         padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
        //                         child: TextField(
        //                           style: const TextStyle(color: Colors.white),
        //                           decoration: InputDecoration(
        //                               prefixIcon: const Icon(Icons.search),
        //                               prefixIconColor: Colors.white54,
        //                               hintText: "Search...",
        //                               hintStyle: const TextStyle(color: Colors.white54),
        //                               focusedBorder: const OutlineInputBorder(
        //                                   borderSide: BorderSide(
        //                                     color: Colors.white,
        //                                   )
        //                               ),
        //                               enabledBorder: OutlineInputBorder(
        //                                   borderSide: BorderSide(
        //                                       color: Colors.grey.shade600
        //                                   )
        //                               )
        //                           ),
        //                         ),
        //                       ),
        //                     ),
        //                   ],
        //                 )
        //               ],
        //             ),
        //           )
        //       )
        //     ],
        //   ),
        // ),
        body: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8),
            //   child: Container(
            //     color: Colors.green[900],
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Padding(
            //           padding: EdgeInsets.all(8.0),
            //           child: Text(
            //             "$region VOTER'S PHOTO ALBUM",
            //             style: Global.normalsize,
            //           ),
            //         ),
            //         SizedBox(
            //           width: 400,
            //           child: Padding(
            //             padding: const EdgeInsets.only(right: 8.0, top: 8.0, bottom: 8.0),
            //             child: TextField(
            //               style: const TextStyle(color: Colors.white),
            //               decoration: InputDecoration(
            //                   prefixIcon: const Icon(Icons.search),
            //                   prefixIconColor: Colors.white54,
            //                   hintText: "Search...",
            //                   hintStyle: const TextStyle(color: Colors.white54),
            //                   focusedBorder: const OutlineInputBorder(
            //                       borderSide: BorderSide(
            //                         color: Colors.white,
            //                       )
            //                   ),
            //                   enabledBorder: OutlineInputBorder(
            //                       borderSide: BorderSide(
            //                           color: Colors.grey.shade600
            //                       )
            //                   )
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            StreamBuilder<QuerySnapshot>(
                stream: fbaccount.db.collection("ec_data").where('pscode',isEqualTo: "R081501B").limit(500).snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot>snapshot) {
                  if(snapshot.hasData)
                  {
                    itemcount=snapshot.data!.docs.length;
                    if(itemcount<1)
                    {
                      print("no Data");
                      return Center(child: Text("${fbaccount.region_access.toUpperCase()} HAS NO DATA YET"));
                    }
                    //name=value.myregion[15];
                    for(int i=0; i<itemcount;i++)
                    {
                      String name_txt=snapshot.data!.docs[i]['name'];
                      int age_text=snapshot.data!.docs[i]['age'];
                      String voterid_txt=snapshot.data!.docs[i]['voterid'];
                      String url_txt=snapshot.data!.docs[i]['image'];
                      String sex_txt=snapshot.data!.docs[i]['sex'];
                      dynamic member_txt=snapshot.data!.docs[i]['member'];
                      show.add(FittedBox(child: Text(name_txt, style: Global.smallsize,)));
                      ages.add(FittedBox(child: Text("Age: ${age_text}", style: Global.smallsize)));
                      //myimage.add(ImageNetwork(image: url_txt, height: 180,width: 180,fitWeb: BoxFitWeb.cover,));
                      myimage.add(CachedNetworkImage(imageUrl: url_txt,height: 180,width: 180,fit: BoxFit.contain,));
                      //ptimage.add();
                      sexwidget.add(Text("Sex: ${sex_txt}", style: Global.smallsize));
                      voteidwidget.add(Text("Voter ID: $voterid_txt", style: Global.smallsize));
                      member.add(member_txt);
                      voteridlist.add(snapshot.data!.docs[i]['voterid']);
                      names.add(name_txt);

                      if (isVisible==snapshot.data!.docs[i]['voterid']){

                      }
                    }


                  }

                  else
                  {

                    return const CircularProgressIndicator();
                  }
                  return Expanded(
                    child: GridView.builder(
                      itemCount: itemcount,
                      gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (crossAxisCount).ceil()),
                      itemBuilder: (context, index)
                      {
                        return ContextMenuRegion(
                          contextMenu: ContextMenu(entries: [
                            MenuHeader(text: snapshot.data!.docs[index]['name'],),
                            MenuItem(label: "NDC${fbaccount.region_access}",icon: Icons.umbrella),
                            const MenuItem(label: "NPP"),
                            const MenuItem(label: "Others"),
                            const MenuItem(label: "Floating"),
                          ]),
                          child: Card(
                            elevation: 2,
                            child: Container(
                              width: 400,
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(6))
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.only(top: 10.0,left: 10),
                                          child: myimage[index]
                                      ),
                                      //const SizedBox(width: 1),
                                      Container(
                                        height: 170,
                                        width: 1,
                                        color: Colors.grey,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10.0),
                                        child: Container(
                                          //color: Colors.black.withOpacity(0.2),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Radio(
                                                          value: "NDC",
                                                          groupValue:"${snapshot.data!.docs[index]['member']}" ,
                                                          onChanged: (value)async{
                                                            //await fbaccount.addmember(voteridlist[index], "NDC");
                                                            groupValue=snapshot.data!.docs[index]['member'];
                                                            print(groupValue);
                                                          }
                                                      ),
                                                      Text("NDC",style: Global.semiSmallSize,)
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Radio(
                                                          value: "NPP",
                                                          groupValue: "${snapshot.data!.docs[index]['member']}",
                                                          onChanged: (value){

                                                            // fbaccount.addmember(voteridlist[index], "NPP");
                                                            groupValue="${snapshot.data!.docs[index]['delmember']}";
                                                            //print(value);
                                                          }
                                                      ),
                                                      Text("NPP",style: Global.semiSmallSize,)
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Radio(
                                                          value: "Others",
                                                          groupValue: "${snapshot.data!.docs[index]['member']}",
                                                          onChanged: (value){
                                                            //fbaccount.addmember(voteridlist[index], "Others");

                                                            groupValue="${snapshot.data!.docs[index]['member']}";

                                                          }

                                                      ),
                                                      Text("OTHERS",style: Global.semiSmallSize,)
                                                    ],
                                                  ),
                                                  Row(
                                                    children: [
                                                      Radio(
                                                          value: "Floating",
                                                          groupValue: "${snapshot.data!.docs[index]['member']}",
                                                          onChanged: (value){
                                                            // fbaccount.addmember(voteridlist[index], "Floating");
                                                            groupValue="${snapshot.data!.docs[index]['member']}";
                                                          }
                                                      ),
                                                      Text("FLOAT", style: Global.semiSmallSize,)
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Visibility(
                                                  visible: isVisible,
                                                  child: Image.asset("assets/images/${snapshot.data!.docs[index]['member'].toString().toLowerCase()}.png", height: 40,width: 60,)
                                                //child: Image.asset("assets/images/${snapshot.data!.docs[index]['member'].toString().toLowerCase()}.png", height: 40,width: 60,)
                                              ),
                                              Visibility(
                                                  visible: false,
                                                  child: Image.asset("assets/images/npp.jpg", height: 40,width: 40,)
                                              )
                                            ],
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0, right: 8.0,bottom: 8.0),
                                    child: Card(
                                      elevation: 1,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.red[900],
                                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10))
                                        ),
                                        child:  Padding(
                                          padding: const EdgeInsets.only(left: 10.0, bottom: 8, top: 8, right: 10),
                                          child: Column(
                                            children: [
                                              //const SizedBox(height: 4),
                                              //Text(show[index], style: TextStyle(color: Colors.black, fontSize: 16)),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  show[index],
                                                ],
                                              ),
                                              //const SizedBox(height: 4),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  ages[index],
                                                  const SizedBox(width: 20),
                                                  sexwidget[index],
                                                ],
                                              ),
                                              //const SizedBox(height: 4),
                                              Row(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                children: [
                                                  voteidwidget[index],
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                    ),
                  );
                }
            ),
          ],
        ),
      );
    },
    );
  }
}
