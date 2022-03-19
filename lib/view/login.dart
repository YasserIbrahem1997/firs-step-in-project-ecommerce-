import 'dart:convert';

import 'package:ecommerce/controller/apis.dart';
import 'package:http/http.dart'as http;
import 'package:ecommerce/view/forgotpass.dart';
import 'package:ecommerce/view/info.dart';
import 'package:ecommerce/view/regester.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../constract.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String? emmailController;
  String? passwordController;

  // _loginaa(){
  //   var data={
  //     "email": emmailController,
  //   "password": passwordController
  //   };
  //    var log = APIS().fetchlogin("{$emmailController}","{$passwordController}");
  //
  // }
  Future<void>fetchlogin(String email,String pass)async{
    var url = Uri.parse("https://student.valuxapps.com/api/login");
    var respons = await http.post(url, body: {
      "email": emmailController,
      "password": passwordController
    },
        headers: {
          "lang" : "ar"
        }
    );
    var responsbody= jsonDecode(respons.body);
    if (responsbody["status"] == true) {
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
         Info()), (Route<dynamic> route) => false);
    }  else{
      print(responsbody["message"]);
      final snacBar=SnackBar(
          content: Text(responsbody["message"]),
          behavior: SnackBarBehavior.floating,
      );
      ScaffoldMessenger.of(context).showSnackBar(snacBar);
    }
  }
  @override
  // void dispose() {
  //   _controller.dispose();
  //   super.dispose();
  // }
  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: backimage,
        elevation: 0,

      ),
      backgroundColor: backgorundBody,
      body: Form(
        key: formKey,
        child: FutureBuilder(
          future: APIS.fetchlogin("{$emmailController}", "{$passwordController}"),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {

          return ListView.builder(
            itemCount: 1,
            itemBuilder: (BuildContext context, int index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height /3.9,
                  decoration:const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        backimage,
                        backgorundBody,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                    image: DecorationImage(
                        image: AssetImage("assets/images/back.png"),
                        fit: BoxFit.cover
                    ),
                    // width: MediaQuery.of(context).size.width * 100,
                  ),
                  child: const Padding(
                    padding: const EdgeInsets.only(
                        top: 60,
                        left: 20
                    ),
                    child: ListTile(
                      title: Text(
                        "Welcom,",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: heading,

                        ),
                      ),
                      subtitle: Text("Sign in to Continue",
                        style: TextStyle(
                            color: textcolorprim,
                            fontSize: textnormal
                        ),),
                    ),
                  ),
                ),

                Container(

                    alignment: Alignment.topLeft,
                    padding: EdgeInsets.only(left: 20,
                      top: 20,
                      bottom: 20,
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "Don't have an accont yet ?",
                          style: TextStyle(
                              fontSize: textnormal,
                              fontWeight: FontWeight.bold,
                              color: destext),
                        ),
                        SizedBox(width: 10,),
                        GestureDetector(
                          child: const Text(
                            "Register Now",
                            style: TextStyle(
                              fontSize: textnormal,
                              fontWeight:FontWeight.bold,
                              color: background,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const Regester()),
                            );
                          },
                        ),
                      ],
                    )
                ),
                // text welcom and sing to contant

                Container(
                  margin: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  padding: EdgeInsets.only(left: 5, right: 10),
                  decoration: BoxDecoration(
                      color: backgorundBody,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 10,
                            spreadRadius: 10,
                            offset: Offset(1, 10),
                            color: Colors.green.withOpacity(0.3)),
                      ]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      // text Email up button
                      const Padding(
                        padding:  EdgeInsets.only(left: 15),
                        child: Text("Email"),
                      ),
                      // this text fild emil
                      TextFormField(
                        validator: (value){
                          if (value!.isEmpty ||!RegExp (r'^[\w-\,]+@[\w-]+[\w-]{2,4}').hasMatch(value!)) {
                            return "This field is required";
                          }else {
                            return null;
                          }
                        },

                        keyboardType: TextInputType.emailAddress,
                        onChanged: (value){
                          setState(() {
                            emmailController = value ;
                          });
                        },
                        // controller: emmailController,
                        decoration: InputDecoration(
                          // use the getter variable defined above
                          //   errorText: _errorText,
                          // this text plucholder in butten
                            hintText: "Enter Your Email",
                            hintStyle:const TextStyle(
                              color: destext,
                            ),
                            // icone befor text email
                            prefixIcon:const Icon(
                              Icons.email,
                              color: textcolor,
                            ),
                            //this broder betton email
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:const BorderSide(
                                    width: 1.0, color: backgorundBody)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide:const BorderSide(
                                  width: 1.0,
                                  color: backgorundBody,
                                ))),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // text pass up button
                      const Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text("Password"),
                      ),
                      TextFormField(

                        // here is check
                        validator: (value){
                          if (value!.isEmpty ||!RegExp ("").hasMatch(value!)) {
                            return "This field is pass required";
                          }else {
                            return null;
                          }
                        },
                        onChanged: (value){
                          setState(() {
                            passwordController = value;
                          });
                        },

                        // controller: passwordController,
                        decoration: InputDecoration(
                          // this text plucholder in butten
                            hintText: "Enter Your Password",
                            hintStyle:const TextStyle(
                              color: destext,
                            ),
                            // icone befor text email
                            prefixIcon:const Icon(
                              Icons.lock,
                              color: textcolor,
                            ),
                            //this broder betton email
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                    width: 1.0, color: backgorundBody)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(
                                  width: 1.0,
                                  color: backgorundBody,
                                ))),
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: GestureDetector(
                          child: Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: textnormal,
                              color: textcolor,
                            ),
                          ),
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const ForgotPass()),
                            );
                          },
                        ),
                        //--------- this is another way text -------

                        // RichText(
                        //   text: TextSpan(
                        //       recognizer: TapGestureRecognizer()..onTap=()=>Navigator.of(context).push(
                        //           MaterialPageRoute(
                        //               builder: (context) => const Regester())),
                        //       text: "yasser",
                        //       style: TextStyle(
                        //         color: textcolor,
                        //         fontSize: heading,
                        //       )
                        //   ),
                        //
                        // ),
                        //--------- end this is another way text -------

                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Container(
                          child: ElevatedButton(
                            onPressed: () async{

                              if (formKey.currentState!.validate()){
                                fetchlogin("{$emmailController}", "{$passwordController}");
                              }
                              // if (emmailController == true) {
                              //   fetchlogin("{$emmailController}", "{$passwordController}").then((value) => {
                              //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              //         Info()), (Route<dynamic> route) => false)
                              //   });
                              // }  else if (passwordController == true) {
                              //   fetchlogin("{$emmailController}", "{$passwordController}").then((value) => {
                              //     Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
                              //         Info()), (Route<dynamic> route) => false)
                              //   });
                              //
                              // }  else {
                              //  print (" تحقق من ");
                              // }

                            },
                            child: const Text(
                              " SIGN IN",
                              style: TextStyle(
                                color: textcolorprim,
                                fontSize: textnormal,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding:const EdgeInsets.only(
                                  left: 70,
                                  right: 70,
                                  top: 15,
                                  bottom: 15
                              ),
                              primary: background,

                            ),


                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),

                    ],

                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Center(
                  child: Text("-OR-",
                    style: TextStyle(
                      fontSize: fontXLarge,

                    ),),
                ),
                const SizedBox(
                  height: 15,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.1,

                    decoration:BoxDecoration(
                        color: backgorundBody.withOpacity(0),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: destext,
                        )
                    ),
                    child: ListTile(

                      title: Padding(
                        padding: const EdgeInsets.only(right: 50),
                        child: Center(
                          child: Text(
                            "Sign In with Facebook",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: textnormal,

                            ),
                          ),
                        ),
                      ),
                      leading: Image.asset("assets/images/facebock.png",width: 50,),

                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width/1.1,

                    decoration:BoxDecoration(
                        color: backgorundBody.withOpacity(0),
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          color: destext,
                        )
                    ),
                    child: ListTile(

                        title: const Padding(
                          padding: const EdgeInsets.only(right: 50),
                          child: Center(
                            child: Text(
                              "Sign In with Googel",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: textnormal,

                              ),
                            ),
                          ),
                        ),
                        leading: Image.asset("assets/images/googel.png",width: 50,)
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            );
          },);
        },)
      ),
    );
  }
}

