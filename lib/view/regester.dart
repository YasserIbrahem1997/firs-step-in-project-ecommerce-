import 'dart:convert';

import 'package:ecommerce/constract.dart';
import 'package:ecommerce/controller/apis.dart';
import 'package:ecommerce/view/info.dart';
import 'package:ecommerce/view/login.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class Regester extends StatefulWidget {
  const Regester({Key? key}) : super(key: key);

  @override
  State<Regester> createState() => _RegesterState();
}

class _RegesterState extends State<Regester> {
  String? nameController;
  String? phoneController;
  String? emmailController;
  String? passwordController;
  Future<void> fetchregester(String name,String email,String phone, String pass)async{
    var url = Uri.parse("https://student.valuxapps.com/api/register");
    var respons = await http.post(url, body: {
      "name": nameController,
      "phone": phoneController,
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
          Login()), (Route<dynamic> route) => false);
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
  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: backgorundBody,
      appBar: AppBar(
        backgroundColor: backimage,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 15),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios,
            ),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3.9,
                  decoration: const BoxDecoration(
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
                        fit: BoxFit.fill),
                    // width: MediaQuery.of(context).size.width * 100,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40, left: 20),
                    child: ListTile(
                      title: Text(
                        "Register ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: heading,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
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
                      //------------ text Email up button------------------------
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Name",
                          style: TextStyle(fontSize: textname),
                        ),
                      ),
                      TextFormField(

                        validator: (value){
                          if (value!.isEmpty ||!RegExp ('').hasMatch(value!)) {
                            return "This field is required";
                          }else {
                            return null;
                          }
                        },
                        onChanged: (value){
                          setState(() {
                            nameController = value ;
                          });
                        },
                        decoration: InputDecoration(
                            // this text plucholder in butten
                            hintText: "Enter Your Name",
                            hintStyle: const TextStyle(
                              color: destext,
                            ),
                            // icone befor text email
                            prefixIcon: const Icon(
                              Icons.account_circle_outlined,
                              color: textcolor,
                            ),
                            //this broder betton email
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    width: 1.0, color: backgorundBody)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  width: 1.0,
                                  color: backgorundBody,
                                ))),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      //-----------------------end name fild-------
                      // ------------------end phone fild
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Phone",
                          style: TextStyle(fontSize: textname),
                        ),
                      ),
                      TextFormField(

                        validator: (value){
                          if (value!.isEmpty ||!RegExp ("").hasMatch(value!)) {
                            return "This field is required";
                          }else {
                            return null;
                          }
                        },
                        onChanged: (value){
                          setState(() {
                            phoneController = value ;
                          });
                        },
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                            // this text plucholder in butten
                            hintText: "Enter Your Phone",
                            hintStyle: const TextStyle(
                              color: destext,
                            ),
                            // icone befor text email
                            prefixIcon: const Icon(
                              Icons.phone,
                              color: textcolor,
                            ),
                            //this broder betton email
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    width: 1.0, color: backgorundBody)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  width: 1.0,
                                  color: backgorundBody,
                                ))),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      //-----------------------strat Email fild--------
                      const Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(
                          "Email",
                          style: TextStyle(fontSize: textname),
                        ),
                      ),
                      TextFormField(
                        validator: (value){
                          if (value!.isEmpty ||!RegExp (r'^[\w-\,]+@[\w-]+[\w-]{2,4}').hasMatch(value!)) {
                            return "This field is required";
                          }else {
                            return null;
                          }
                        },
                        onChanged: (value){
                          setState(() {
                            emmailController = value ;
                          });
                        },
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            // this text plucholder in butten
                            hintText: "Enter Your Email",
                            hintStyle: const TextStyle(
                              color: destext,
                            ),
                            // icone befor text email
                            prefixIcon: const Icon(
                              Icons.email,
                              color: textcolor,
                            ),
                            //this broder betton email
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                    width: 1.0, color: backgorundBody)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: const BorderSide(
                                  width: 1.0,
                                  color: backgorundBody,
                                ))),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      //-----------------------end Email fild--------
                      // text pass up button
                      const Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          "Password",
                          style: TextStyle(fontSize: textname),
                        ),
                      ),
                      TextFormField(
                        validator: (value){
                          if (value!.isEmpty ||!RegExp ('').hasMatch(value!)) {
                            return "This field is required";
                          }else {
                            return null;
                          }
                        },
                        onChanged: (value){
                          setState(() {
                            passwordController = value ;
                          });
                        },
                        decoration: InputDecoration(
                            // this text plucholder in butten
                            hintText: "Enter Your Password",
                            hintStyle: const TextStyle(
                              color: destext,
                            ),
                            // icone befor text email
                            prefixIcon: const Icon(
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
                        height: 35,
                      ),

                      //-----------------button sign up ---------------
                      Center(
                        child: Container(
                          child: ElevatedButton(
                            onPressed: () async{

                              if (formKey.currentState!.validate()){
                                fetchregester("{$nameController}", "{$phoneController}", "{$emmailController}", "{$passwordController}");
                              }
                            },
                            child: const Text(
                              " SIGN UP",
                              style: TextStyle(
                                color: textcolorprim,
                                fontSize: textnormal,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.only(
                                  left: 70, right: 70, top: 15, bottom: 15),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}
