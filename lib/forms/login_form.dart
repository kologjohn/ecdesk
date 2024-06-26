import 'package:ndcdata/database/databases.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:provider/provider.dart';

import 'form_field.dart';

class LoginForm extends StatelessWidget {
   LoginForm({super.key});

  final formskey=GlobalKey<FormState>();
  bool validator(){
    return formskey.currentState!.validate();

  }
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: Consumer<FirebaseAccounts>(builder: (BuildContext context, FirebaseAccounts value, Widget? child) {

        return Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/Mahama1.jpg"),
                        fit: BoxFit.cover,
                      )
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green[900]?.withOpacity(0.6),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(
                        maxWidth: 500,
                        maxHeight: 300,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(Radius.circular(12)),
                            color: Colors.green[900]?.withOpacity(0.5)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Form(
                              key: formskey,
                              child: ListView(
                                children: [
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Login",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25
                                        ),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  FormFields(
                                    validate: (txt){
                                      if(txt.toString().length<10){
                                        return "Phone number must be more than ten";
                                      }
                                    },
                                    hintText: 'Phone',
                                    labelText: 'Phone',
                                    controller: email,
                                    textInputType: TextInputType.phone,
                                    obscure: false,
                                    enabled: true,
                                  ),
                                  const SizedBox(height: 8),
                                  FormFields(
                                    validate: (txt){
                                      if(txt.toString().length<6){
                                        return "Password must be six numbers or more";
                                      }
                                    },
                                    hintText: 'Password',
                                    labelText: 'Password',
                                    controller: password,
                                    textInputType: TextInputType.number,
                                    obscure: true,
                                    enabled: true,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: (){},
                                        child: const Text(
                                          "Forgot Password?",
                                          style: TextStyle(
                                              color: Colors.white
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(7)
                                    ),
                                    child: ElevatedButton(
                                      onPressed: () async{
                                        final progress=ProgressHUD.of(context);
                                        // Future.delayed(Duration(seconds: 10),(){
                                        //   progress!.dismiss();
                                        // });
                                        validator();

                                          progress!.show();
                                          await value.login(email.text,password.text,context);
                                          progress.dismiss();
                                        SnackBar snackbar=SnackBar(content: Text(value.error,style: TextStyle(color: Colors.white),),backgroundColor: Colors.pink,);
                                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                                        progress!.dismiss();



                                      },
                                      style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(200, 40),
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                      ),
                                      child: const Text(
                                        'Sign in',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
        );
      },
      ),
    );
  }
}
