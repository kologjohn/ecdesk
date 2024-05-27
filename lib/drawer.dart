import 'package:flutter/material.dart';
import 'package:ndcdata/regions/regions.dart';
import 'package:ndcdata/res/new_screen_view.dart';
import 'package:ndcdata/widgets/register.dart';

class DemoDrawer extends StatelessWidget {
  const DemoDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 300,
      backgroundColor: Colors.white70,
      child: SafeArea(
        child: ListView(
          children: [
             DrawerHeader(child: CircleAvatar(
              radius: 80,
              backgroundColor: Colors.green[900],
              child: Image.asset("assets/images/ndc3.png", height: 60,width: 60,),
            )),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('HOME', style: TextStyle(color: Colors.black),),
              onTap: (){
                ///Navigator.push(context, MaterialPageRoute(builder: (context)=>const ResponsivenessLayout()));
              },
            ),
            ExpansionTile(
              title: const Text('RESULTS', style: TextStyle(color: Colors.black),),
              leading: const Icon(Icons.person_2),
              childrenPadding: const EdgeInsets.only(left: 60),
              children: [
                ListTile(title: const Text('ADD STAFF', style: TextStyle(color: Colors.black54),),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegisterMember()));
                  },
                ),
                ListTile(title: const Text('Data 2', style: TextStyle(color: Colors.black54),),onTap: (){
                  //Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegionsView()));

                },),
              ],
            ),
            ListTile(
              leading: const Icon(Icons.money),
              title: const Text('COLLATION', style: TextStyle(color: Colors.black),),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.money),
              title: const Text('COLLATION', style: TextStyle(color: Colors.black),),
              onTap: (){},
            ),
            ListTile(
              leading: const Icon(Icons.money),
              title: const Text('COLLATION', style: TextStyle(color: Colors.black),),
              onTap: (){},
            ),
          ],
        ),
      ),

    );
  }
}
