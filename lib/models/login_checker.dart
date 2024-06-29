// ignore_for_file: sized_box_for_whitespace

import 'package:black_box/const/const.dart';
import 'package:black_box/modules/home/home.dart';
import 'package:flutter/material.dart';

class LoginChecker{ //START

 final BuildContext context;
 LoginChecker({required this.context});

//Checker Fun
void checker(String user, String password){
  if(user == "Pvt.Haseb" && password == "Pilot"){
    Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()),);
  }
  else{
    showAlertDialog(context);
  }
}


//Alert Box
void showAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Warning!'),

          content: Container(
            height: 21,
            child: const Column(children: [Text('User name Or Password is Incorrect.'),]),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK',style: TextStyle(color: Specs().cBlack),),
          onPressed: () {Navigator.of(context).pop();
          },
          
            ),
          ],
        );
      },
    );
  }

} //Class End;
