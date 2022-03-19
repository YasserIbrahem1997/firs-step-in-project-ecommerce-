import 'dart:convert';

import 'package:http/http.dart' as http;

class APIS{
static Future<void> fetchlogin(String email, String pass)async{
    var url = Uri.parse("https://student.valuxapps.com/api/login");
    var respons = await http.post(url, body: {
      "email": email,
      "password": pass
    },
      headers: {
      "lang" : "ar"
      }
    );
    var responsbody= jsonDecode(respons.body);
    if (responsbody["status"] == true) {
      print(responsbody["message"]);
    }  else{
      print(responsbody["message"]);
    }
  }
  // ------------------------------------------------------
 Future<void> fetchregester(String name,String email,String phone, String pass)async{
   var url = Uri.parse("https://student.valuxapps.com/api/login");
   var respons = await http.post(url, body: {
     "name": name,
     "phone": phone,
     "email": email,
     "password": pass
   },
       headers: {
         "lang" : "ar"
       }
   );
   var responsbody= jsonDecode(respons.body);
   if (responsbody["status"] == true) {
     print(responsbody["message"]);
   }  else{
     print(responsbody["message"]);
   }
 }
}
