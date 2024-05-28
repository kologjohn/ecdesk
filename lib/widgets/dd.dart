import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_context_menu/flutter_context_menu.dart';

import '../global_colors.dart';
class Cards extends StatefulWidget {
  const Cards({super.key});

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  Widget build(BuildContext context) {
    return  ContextMenuRegion(
      contextMenu: ContextMenu(entries: [
        const MenuHeader(text:"NAME"),
        const MenuItem(label: "NDC",icon: Icons.umbrella),
        const MenuItem(label: "NPP"),
        const MenuItem(label: "Others"),
        const MenuItem(label: "Floating"),
      ]),
      child: Card(
        elevation: 2,
        child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 10.0,left: 10),
                      child: CachedNetworkImage( imageUrl: '',)
                  ),
                  const SizedBox(width: 1),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Container(
                      //color: Colors.green[900],
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
                                      groupValue:"placeholder" ,
                                      onChanged: (value)async{
                                        //await fbaccount.addmember(voteridlist[index], "NDC");
                                        //groupValue=snapshot.data!.docs[index]['member'];
                                        //print(groupValue);
                                      }
                                  ),
                                  Text("NDC",style: Global.semiSmallSize,)
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                      value: "NPP",
                                      groupValue: "placeholder",
                                      onChanged: (value){

                                        // fbaccount.addmember(voteridlist[index], "NPP");
                                       // groupValue="placeholder";
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
                                      groupValue: "placeholder",
                                      onChanged: (value){
                                        //fbaccount.addmember(voteridlist[index], "Others");

                                        //groupValue="placeholder";

                                      }

                                  ),
                                  Text("OTHERS",style: Global.semiSmallSize,)
                                ],
                              ),
                              Row(
                                children: [
                                  Radio(
                                      value: "Floating",
                                      groupValue: "placeholder",
                                      onChanged: (value){
                                        // fbaccount.addmember(voteridlist[index], "Floating");
                                        //groupValue="placeholder";
                                      }
                                  ),
                                  Text("FLOAT", style: Global.semiSmallSize,)
                                ],
                              ),
                            ],
                          ),
                          Visibility(
                              visible: true,
                              child: Image.asset("assets/images/null.png", height: 40,width: 60,)
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
                    height: 80,
                    color: Colors.red[900],
                    child:  Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        children: [
                          //const SizedBox(height: 4),
                          //Text(show[index], style: TextStyle(color: Colors.black, fontSize: 16)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Show"),
                            ],
                          ),
                          //const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Age"),
                               SizedBox(width: 20),
                              Text("Sex"),
                            ],
                          ),
                          //const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                             Text("Voter ID"),
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
}
