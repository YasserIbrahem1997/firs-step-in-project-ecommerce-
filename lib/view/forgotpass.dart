import 'package:ecommerce/constract.dart';
import 'package:ecommerce/view/regester.dart';
import 'package:flutter/material.dart';
class ForgotPass extends StatelessWidget {
  const ForgotPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: backimage,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(
              left: 15
          ),
          child: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios,),
          ),
        ),
       title: Padding(
         padding: const EdgeInsets.only(right: 48.0),
         child: Center(
           child: Text("Forgot Password?",style: TextStyle(
             fontSize:textname ,
             fontWeight: FontWeight.bold ,
             color: textcolor,

           ),),
         ),
       ),

      ),
      backgroundColor: backgorundBody,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                height: MediaQuery.of(context).size.height /2.9,
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
                      image: AssetImage("assets/images/forgotapss.png"),
                      fit: BoxFit.cover
                  ),
                  // width: MediaQuery.of(context).size.width * 100,
                ),

              ),
              SizedBox(height: 50,),
              Container(
                  margin: EdgeInsets.only(
                    left: 20,
                    right: 20
                  ),

                  child: Text("Don't Worry! Just fill in your registered email "
                  "id and we'll help you reset your password ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: textname,



                ),
                  )),
              SizedBox(height: 25,),
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
                    TextField(
                      decoration: InputDecoration(
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
                      height: 25,
                    ),
                    Center(
                      child: Container(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: const Text(
                            " Reset Password",
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

            ],
          ),
        ],
      ),
    );
  }
}
