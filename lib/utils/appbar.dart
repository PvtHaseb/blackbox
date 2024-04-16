import 'package:flutter/material.dart';

AppBar defaultAppBar({          //Constructor Calls These Parameters whenever The code is being compiled every time.
  required String appBarTitle, //AppBar Title.
  IconButton? iconButton,     //IF u WANT icons in the AppBar!.
  Color? appbarColor,
  IconButton? backwordArrow,
  double? elevation,
})

{
  return AppBar(
    backgroundColor: appbarColor,
    elevation: elevation,
    
    title: Text(appBarTitle, style: const TextStyle(color: Colors.deepPurple)), //AppBar Title in a String Varaible Will be used in a TEXT Widget... Just pass it Tgat String.
    leading: backwordArrow,               //An Arrow To back in Pages
    actions: <Widget>[                     //ICON will be in Actions Not Leadings.
    Image.asset("assets/images/tmc.png"),
      if (iconButton != null) iconButton, //A Failur Safe Gurad to Prevent NULL error and also Check if there is an ICON or NOT.
    ],
  );
}


//=======================================================================
//OLD APP BAR

// Widget appBar({
//   required Widget     appbarTitle,
//   Widget?             appbarLeading,
//   List<Widget>?       appbarActionsList,
//   double?             appbarElevation,
//   Color?              appbarBackgroundColor,
//   Color?              appbarShadowColor,
//   Color?              appbarForegroundColor,
// }) =>

// AppBar(
//   title:            appbarTitle,
//   leading:          appbarLeading,
//   actions:          appbarActionsList,
//   elevation:        appbarElevation,
//   backgroundColor:  appbarBackgroundColor,
//   shadowColor:      appbarShadowColor,
//   foregroundColor:  appbarForegroundColor,
// );
//=======================================================================