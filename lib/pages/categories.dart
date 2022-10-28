import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print("object");
      },
      child: Container(
        margin: EdgeInsets.only(top: 50),
        color: Color.fromARGB(255, 189, 181, 181),
        width: 200,
        alignment: Alignment.center,
         height: 50,
        child: Text("Create account",style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),)
      ),
    );
  }
}
