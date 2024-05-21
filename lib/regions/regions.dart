// import 'package:bottom_sheet/bottom_sheet.dart';
// import 'package:flutter/material.dart';
// import 'package:ecdesk/database/databases.dart';
//
// class RegionsView extends StatefulWidget {
//   const RegionsView({super.key});
//
//   @override
//   State<RegionsView> createState() => _RegionsViewState();
// }
//
// class _RegionsViewState extends State<RegionsView> {
//   bool editform=false;
//   bool edit=true;
//   TextEditingController nameController=TextEditingController();
//   TextEditingController contactController=TextEditingController();
//   TextEditingController roleController=TextEditingController();
//   TextEditingController emailController=TextEditingController();
//   TextEditingController passwordController=TextEditingController();
//   String? myName;
//   String? myContact;
//   String? myRole;
//   String? myEmail;
//   String? myPassword;
//
//   List contacts=[];
//   List names=[];
//   final _staffStream = FirebaseAccounts.db.collection("staff").snapshots();
//   List item=['National', 'Regional', 'Constituency'];
//   String? selectedCategory;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: const IconThemeData(color: Colors.white),
//         backgroundColor: Colors.black,
//         title: const Text('EC DATA',style: TextStyle(color: Colors.white),),
//       ),
//       body: StreamBuilder(
//           stream: _staffStream,
//           builder: (context, snapshot){
//             if (snapshot.hasError){
//               return const Text("Connection error");
//             }
//              else if(snapshot.connectionState == ConnectionState.waiting){
//               return const Text("Loading...",style: TextStyle(color: Colors.black),);
//             }
//             // else if(snapshot.hasData)
//             //   {
//             //     return const Text("NO Records Found");
//             //   }
//             var docs = snapshot.data!.docs;
//             //return Text('${docs.length}');
//             return ListView.builder(
//               itemCount: docs.length,
//                 itemBuilder: (context, index){
//                 //final mapdata={"access":"ss"};
//                 //FirebaseAccounts.db.collection("staff").doc(docs[index].id).update(mapdata);
//
//                   // return ListTile(
//                   //   leading: const Icon(Icons.person),
//                   //   title: Text(docs[index]['name']),
//                   //   subtitle: Text(docs[index]['contact']),
//                   // );
//                   return Padding(
//                     padding: const EdgeInsets.only(left: 8.0,right: 8.0,top: 8.0),
//                     child: InkWell(
//                       onTap: (){
//                         showStickyFlexibleBottomSheet(
//                             minHeight: 0,
//                             initHeight: 0.5,
//                             maxHeight: 1,
//                             headerHeight: 100,
//                             bottomSheetColor: Colors.white,
//                             context: context,
//                             headerBuilder: (BuildContext context, double offset){
//                               return Container(
//                                 color: Colors.grey[400],
//                                 child:  Column(
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(left: 16, top: 40, right: 16),
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           const Text(
//                                             "Staff Details",
//                                             style: TextStyle(
//                                               fontSize: 18,
//                                             ),
//                                           ),
//                                           Row(
//                                             children: [
//                                               ElevatedButton.icon(
//                                                 onPressed: (){
//                                                   setState(() {
//                                                      editform=true;
//                                                      edit=false;
//                                                   });
//                                                   print(editform);
//
//                                                 },
//                                                 icon: const Icon(Icons.update, size: 15, color: Colors.white54,),
//                                                 label:  const Text('Edit Staff', style: TextStyle(color: Colors.white),),
//                                                 style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.orange)),
//                                               ),
//                                               const SizedBox(width: 5),
//                                               ElevatedButton.icon(
//                                                 onPressed: ()async{
//                                                   await FirebaseAccounts.db.collection("staff").doc(docs[index]['contact']).delete();
//                                                   print("${docs[index]['contact']}");
//                                                 },
//                                                 icon: const Icon(Icons.delete_forever, size: 15, color: Colors.white54,),
//                                                 label: const Text('Delete Staff', style: TextStyle(color: Colors.white),),
//                                                 style: ButtonStyle(backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.red)),
//                                               ),
//                                             ],
//                                           )
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               );
//                             },
//                             bodyBuilder: (BuildContext context, offset){
//
//                               return SliverChildListDelegate(
//                                   [
//                                     Visibility(
//                                       visible: edit,
//                                       child: Container(
//                                         height: 1000,
//                                         color: Colors.white54,
//                                         child:  Column(
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   const Text("Name", style: TextStyle(fontSize: 20),),
//                                                   Text("${docs[index]['name']}", style: const TextStyle(fontSize: 20)),
//                                                 ],
//                                               ),
//                                             ),
//                                             const Padding(
//                                               padding: EdgeInsets.only(left: 16, right: 16),
//                                               child: Divider(
//                                                 color: Colors.blue,
//                                               ),
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.only(top: 8.0,left: 16, right: 16),
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   const Text("Role", style: TextStyle(fontSize: 20)),
//                                                   Text("${docs[index]['role']}", style: const TextStyle(fontSize: 20)),
//                                                 ],
//                                               ),
//                                             ),
//                                             const Padding(
//                                               padding: EdgeInsets.only(left: 16, right: 16),
//                                               child: Divider(),
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   const Text("Contact", style: TextStyle(fontSize: 20)),
//                                                   Text("${docs[index]['contact']}", style: const TextStyle(fontSize: 20)),
//                                                 ],
//                                               ),
//                                             ),
//                                             const Padding(
//                                               padding: EdgeInsets.only(left: 16, right: 16),
//                                               child: Divider(),
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   const Text("Email", style: TextStyle(fontSize: 20)),
//                                                   Text("${docs[index]['email']}", style: const TextStyle(fontSize: 20)),
//                                                 ],
//                                               ),
//                                             ),
//                                             const Padding(
//                                               padding: EdgeInsets.only(left: 16, right: 16),
//                                               child: Divider(),
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.only(top: 8.0,left: 16, right: 16),
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   const Text("Access Level", style: TextStyle(fontSize: 20)),
//                                                   Text("${docs[index]['access']}", style: const TextStyle(fontSize: 20)),
//                                                 ],
//                                               ),
//                                             ),
//                                             const Padding(
//                                               padding: EdgeInsets.only(left: 16, right: 16),
//                                               child: Divider(),
//                                             ),
//                                             Padding(
//                                               padding: const EdgeInsets.only(top: 8.0, left: 16, right: 16),
//                                               child: Row(
//                                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                 children: [
//                                                   const Text("Password", style: TextStyle(fontSize: 20)),
//                                                   Text("${docs[index]['password']}", style: const TextStyle(fontSize: 20)),
//                                                 ],
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                     ),
//                                      Visibility(
//                                        visible:editform,
//                                        child: Form(
//                                           child: Padding(
//                                             padding: const EdgeInsets.all(8.0),
//                                             child: Column(
//                                               children: [
//                                                 TextFormField(
//                                                   onChanged: (text){
//                                                     myName=text;
//                                                   },
//                                                   initialValue: docs[index]['name'],
//                                                   decoration: InputDecoration(
//                                                       enabledBorder: OutlineInputBorder(
//                                                           borderSide: const BorderSide(
//                                                             color: Colors.blueGrey,
//                                                             width: 3,
//                                                           ),
//                                                           borderRadius: BorderRadius.circular(10)
//                                                       ),
//                                                       focusedBorder: OutlineInputBorder(
//                                                           borderSide: const BorderSide(
//                                                             color: Colors.orange,
//                                                             width: 3,
//                                                           ),
//                                                           borderRadius: BorderRadius.circular(10)
//                                                       ),
//                                                       hintText: 'Staff Name',
//                                                       labelText: "Staff Name"
//                                                   ),
//
//                                                 ),
//                                                 const SizedBox(height: 8),
//                                                 TextFormField(
//                                                   onChanged: (text){
//                                                     myContact=text;
//                                                   },
//                                                   initialValue: docs[index]['contact'],
//                                                   decoration: InputDecoration(
//                                                       enabledBorder: OutlineInputBorder(
//                                                           borderSide: const BorderSide(
//                                                             color: Colors.blueGrey,
//                                                             width: 3,
//                                                           ),
//                                                           borderRadius: BorderRadius.circular(10)
//                                                       ),
//                                                       focusedBorder: OutlineInputBorder(
//                                                           borderSide: const BorderSide(
//                                                             color: Colors.green,
//                                                             width: 3,
//                                                           ),
//                                                           borderRadius: BorderRadius.circular(10)
//                                                       ),
//                                                       hintText: 'Staff contact',
//                                                       labelText: "Staff contact"
//                                                   ),
//                                                 ),
//                                                 const SizedBox(height: 8),
//                                                 TextFormField(
//                                                   onChanged: (text){
//                                                     myRole=text;
//                                                   },
//                                                   initialValue: docs[index]['role'],
//                                                   decoration: InputDecoration(
//                                                       enabledBorder: OutlineInputBorder(
//                                                           borderSide: const BorderSide(
//                                                             color: Colors.blueGrey,
//                                                             width: 3,
//                                                           ),
//                                                           borderRadius: BorderRadius.circular(10)
//                                                       ),
//                                                       focusedBorder: OutlineInputBorder(
//                                                           borderSide: const BorderSide(
//                                                             color: Colors.green,
//                                                             width: 3,
//                                                           ),
//                                                           borderRadius: BorderRadius.circular(10)
//                                                       ),
//                                                       hintText: 'Staff Role',
//                                                       labelText: "Staff Role"
//                                                   ),
//                                                 ),
//                                                 const SizedBox(height: 8),
//                                                 DropdownButtonFormField<String>(
//                                                   validator: (value) {
//                                                     if (value == null || value.isEmpty) {
//                                                       return 'Please select an option';
//                                                     }
//                                                     return null;
//                                                   },
//                                                   decoration: InputDecoration(
//                                                       enabledBorder: OutlineInputBorder(
//                                                           borderSide: const BorderSide(
//                                                             color: Colors.blueGrey,
//                                                             width: 3,
//                                                           ),
//                                                           borderRadius: BorderRadius.circular(10)
//                                                       ),
//                                                       focusedBorder: OutlineInputBorder(
//                                                           borderSide: const BorderSide(
//                                                             color: Colors.green,
//                                                             width: 3,
//                                                           ),
//                                                           borderRadius: BorderRadius.circular(10)
//                                                       ),
//                                                       labelText: "Access Level",
//                                                       hintText: "Access level",
//                                                       hintStyle: TextStyle(color: Colors.grey[500])),
//                                                   value: docs[index]['access'],
//                                                   items: item.map((category) => DropdownMenuItem<String>(
//                                                     value: category,
//                                                     child: Text(category),
//
//                                                   )).toList(),
//                                                   onChanged: (value) {
//                                                     //print(value);
//                                                     selectedCategory=value;
//                                                     setState(() {
//                                                       selectedCategory = value;
//                                                     });
//                                                   },
//                                                 ),
//                                                 const SizedBox(height: 8,),
//                                                 TextFormField(
//                                                   onChanged: (text){
//                                                     myEmail=text;
//                                                   },
//                                                   initialValue: docs[index]['email'],
//                                                   decoration: InputDecoration(
//                                                       enabledBorder: OutlineInputBorder(
//                                                           borderSide: const BorderSide(
//                                                             color: Colors.blueGrey,
//                                                             width: 3,
//                                                           ),
//                                                           borderRadius: BorderRadius.circular(10)
//                                                       ),
//                                                       focusedBorder: OutlineInputBorder(
//                                                           borderSide: const BorderSide(
//                                                             color: Colors.green,
//                                                             width: 3,
//                                                           ),
//                                                           borderRadius: BorderRadius.circular(10)
//                                                       ),
//                                                       hintText: 'Staff Email',
//                                                       labelText: "Staff Email"
//                                                   ),
//                                                 ),
//                                                 const SizedBox(height: 8),
//                                                 TextFormField(
//                                                   onChanged: (text){
//                                                     myPassword=text;
//                                                   },
//                                                   initialValue: docs[index]['password'],
//                                                   decoration: InputDecoration(
//                                                       enabledBorder: OutlineInputBorder(
//                                                           borderSide: const BorderSide(
//                                                             color: Colors.blueGrey,
//                                                             width: 3,
//                                                           ),
//                                                           borderRadius: BorderRadius.circular(10)
//                                                       ),
//                                                       focusedBorder: OutlineInputBorder(
//                                                           borderSide: const BorderSide(
//                                                             color: Colors.green,
//                                                             width: 3,
//                                                           ),
//                                                           borderRadius: BorderRadius.circular(10)
//                                                       ),
//                                                       hintText: 'Password',
//                                                       labelText: "Password"
//                                                   ),
//                                                 ),
//                                                 const SizedBox(height: 8),
//                                                 ElevatedButton(
//                                                     onPressed: () async{
//                                                       setState(() {
//                                                         editform=false;
//                                                         edit=true;
//                                                       });
//                                                       print(myContact);
//                                                       final updatedaa={
//                                                         "name":myName,
//                                                         "contact":myContact,
//                                                         "role":myRole,
//                                                         "email":myEmail,
//                                                         "password":myPassword,
//                                                         "access":selectedCategory,
//                                                       };
//                                                       await FirebaseAccounts.db.collection("staff").doc(docs[index].id).set(updatedaa);
//                                                     },
//                                                     child: const Text("Update")
//                                                 )
//                                               ],
//                                             ),
//                                           )
//                                        ),
//                                      )
//                                   ]
//                               );
//                             }
//                         );
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.green[900],
//                           borderRadius: const BorderRadius.all(Radius.circular(8))
//                         ),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   const Text("Name:", style: TextStyle(fontSize: 18, color: Colors.white)),
//                                   Text(docs[index]['name'], style: const TextStyle(fontSize: 18, color: Colors.white),),
//                                 ],
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   const Text("Access Level:", style: TextStyle(fontSize: 18, color: Colors.white)),
//                                   Text(docs[index]['access'], style: const TextStyle(fontSize: 18, color: Colors.white),),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 }
//             );
//           }
//       )
//     );
//   }
// }
