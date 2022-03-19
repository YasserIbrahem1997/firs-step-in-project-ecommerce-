import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
          child: Text("Hello World ",
          style: TextStyle(
            fontSize: 20,
            color: Colors.black
          ),
          )),
    );
  }
}
