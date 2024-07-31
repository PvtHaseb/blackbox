// ignore_for_file: sized_box_for_whitespace, unused_import

import 'package:black_box/const/const.dart';
import 'package:black_box/modules/home/home%20-%20Copy.dart';
import 'package:black_box/modules/home/home.dart';
import 'package:flutter/material.dart';

class LoginChecker{ //START

 final BuildContext context;
 LoginChecker({required this.context});

//Checker Fun
void checker(String user, String password){
  if(user == "TMC" && password == "TMC@2024"){
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
          title: const Text('خطأ!'),

          content: Container(
            height: 21,
            child: const Column(children: [Text('خطأ في اسم المستخدم او كلمة المرور.'),]),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('متابعة',style: TextStyle(color: Specs().cBlack),),
          onPressed: () {Navigator.of(context).pop();
          },
          
            ),
          ],
        );
      },
    );
  }

} //Class End;
