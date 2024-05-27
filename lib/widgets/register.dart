import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';
import 'package:ndcdata/database/databases.dart';

import '../regions/regions.dart';

class RegisterMember extends StatefulWidget {
  const RegisterMember({super.key});

  @override
  State<RegisterMember> createState() => _RegisterMemberState();
}

class _RegisterMemberState extends State<RegisterMember> {
  final formKey = GlobalKey<FormState>();
  TextEditingController controllerName=TextEditingController();
  TextEditingController controllerContact=TextEditingController();
  TextEditingController controllerRole=TextEditingController();
  TextEditingController controllerEmail=TextEditingController();
  TextEditingController controllerPassword=TextEditingController();
  String? selectedCategory;

  String addStaff="Save staff";

  @override
  Widget build(BuildContext context) {
    return  Consumer<FirebaseAccounts>(
      builder: (BuildContext context, fbaccount, Widget? child) {

        return Scaffold(
          body: ProgressHUD(
            child: Builder(
                builder: (context){
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                          child: Card(
                            elevation: 10,
                            child: Container(
                              color: Colors.white,
                              height: 600,
                              width: 550,
                              child: Form(
                                  key: formKey,
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "STAFF REGISTRATION",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.green[900]
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                                        child: TextFormField(
                                          validator: (value){
                                            if (value!.isEmpty){
                                              return "Please enter staff name";
                                            }
                                            return null;
                                          },
                                          controller: controllerName,
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.blueGrey,
                                                    width: 3,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.green,
                                                    width: 3,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              hintText: 'Staff Name',
                                              labelText: "Staff Name"
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                                        child: TextFormField(
                                          // validator: (value){
                                          //   if (value ==null || value.isEmpty){
                                          //     return "Please enter staff contact";
                                          //   }
                                          //   return null;
                                          // },
                                          controller: controllerContact,
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.blueGrey,
                                                    width: 3,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.green,
                                                    width: 3,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              hintText: 'Staff Contact',
                                              labelText: "Staff Contact"
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                                        child: TextFormField(
                                          // validator: (value){
                                          //   if (value ==null || value.isEmpty){
                                          //     return "Please enter staff role";
                                          //   }
                                          //   return null;
                                          // },
                                          controller: controllerRole,
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.blueGrey,
                                                    width: 3,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.green,
                                                    width: 3,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              hintText: 'Staff Role',
                                              labelText: "Staff Role"
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                                        child: TextFormField(
                                          // validator: (value){
                                          //   if (value ==null || value.isEmpty){
                                          //     return "Please enter staff email";
                                          //   }
                                          //   return null;
                                          // },
                                          keyboardType: TextInputType.emailAddress,
                                          controller: controllerEmail,
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.blueGrey,
                                                    width: 3,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.green,
                                                    width: 3,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              hintText: 'Staff Email',
                                              labelText: "Staff Email"
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                                        child: DropdownButtonFormField<String>(
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Please select an option';
                                            }
                                            return null;
                                          },
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.blueGrey,
                                                    width: 3,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.green,
                                                    width: 3,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              labelText: "Access Level",
                                              hintText: "Access level",
                                              hintStyle: TextStyle(color: Colors.grey[500])),
                                          value: selectedCategory,
                                          items: ['National', 'Regional', 'Constituency']
                                              .map((category) => DropdownMenuItem<String>(
                                            value: category,
                                            child: Text(category),
                                          ))
                                              .toList(),
                                          onChanged: (value) {
                                            //print(value);
                                            selectedCategory=value;
                                            setState(() {
                                              selectedCategory = value;
                                            });
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                                        child: TextFormField(
                                          // validator: (value){
                                          //   if (value ==null || value.isEmpty){
                                          //     return "Please enter a valid password";
                                          //   }
                                          //   return null;
                                          // },
                                          obscureText: true,
                                          controller: controllerPassword,
                                          decoration: InputDecoration(
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.blueGrey,
                                                    width: 3,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: const BorderSide(
                                                    color: Colors.green,
                                                    width: 3,
                                                  ),
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                              hintText: 'Password',
                                              labelText: "Password"
                                          ),
                                        ),
                                      ),
                                      Visibility(visible: fbaccount.recordexist,child: const Text("This Staff already exist",style: TextStyle(color: Colors.red),)),
                                      Visibility(visible: fbaccount.saved,child: const Text("Record Saved",style: TextStyle(color: Colors.green),)),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    gradient: const LinearGradient(
                                                      colors: [
                                                        Colors.green,
                                                        Colors.greenAccent,
                                                        Colors.lightGreen,
                                                      ],
                                                      begin: Alignment.bottomLeft,
                                                      end: Alignment.topRight,
                                                    ),
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: ElevatedButton(onPressed: ()async{
                                                  if (formKey.currentState!.validate()){
                                                    final progress = ProgressHUD.of(context);
                                                    progress?.showWithText('Saving...');

                                                    String name = controllerName.text;
                                                    String contact = controllerContact.text;
                                                    String role = controllerRole.text;
                                                    String email = controllerEmail.text;
                                                    String password = controllerPassword.text;
                                                    String? access=selectedCategory;
                                                    addStaff='please wait';
                                                    //await fbaccount.register(name, email, contact, role, password, access!);
                                                    print(fbaccount.saved);
                                                    if(fbaccount.saved)

                                                    {
                                                      addStaff="Add Staff";
                                                      controllerName.clear();
                                                      controllerPassword.clear();
                                                      controllerEmail.clear();
                                                      controllerContact.clear();
                                                      controllerRole.clear();
                                                    }
                                                    else{

                                                    }
                                                    progress?.dismiss();


                                                  }

                                                },
                                                    style: ElevatedButton.styleFrom(
                                                      fixedSize: const Size(150, 50),
                                                      backgroundColor: Colors.transparent,
                                                      shadowColor: Colors.transparent,
                                                    ),
                                                    child:  Text(addStaff, style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w600),)
                                                )
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    gradient: const LinearGradient(
                                                      colors: [
                                                        Colors.green,
                                                        Colors.greenAccent,
                                                        Colors.lightGreen,
                                                      ],
                                                      begin: Alignment.bottomLeft,
                                                      end: Alignment.topRight,
                                                    ),
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                                child: ElevatedButton(onPressed: ()async{
                                                 // Navigator.push(context, MaterialPageRoute(builder: (context)=>const RegionsView()));

                                                },
                                                    style: ElevatedButton.styleFrom(
                                                      fixedSize: const Size(150, 50),
                                                      backgroundColor: Colors.transparent,
                                                      shadowColor: Colors.transparent,
                                                    ),
                                                    child:  const Text("View Staff", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),)
                                                )
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          )
                      ),
                    ],
                  );
                }
            )
          ),
        );
      },
    );
  }
}
