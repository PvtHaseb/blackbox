// ignore_for_file: unused_import

import 'package:black_box/const/bloc/bloc_observer.dart';
import 'package:black_box/models/database/db_init.dart';
import 'package:black_box/modules/corru_disco/corru_discov.dart';
import 'package:black_box/modules/dashboard/dashboard.dart';
import 'package:black_box/modules/home/home.dart';
import 'package:black_box/modules/library/lib.dart';
import 'package:black_box/modules/print/print.dart';
import 'package:black_box/modules/splash/welcome.dart';
import 'package:bloc/bloc.dart';
import 'package:window_manager/window_manager.dart';
import 'package:flutter/material.dart';

void main() async {
  // initialize isar Items DataBase
  WidgetsFlutterBinding.ensureInitialized();
  await DBinit.initalizeDataBase();
  

  //Onces Again for the Screen Size Adjuster.
  WidgetsFlutterBinding.ensureInitialized();
  //await windowManager.ensureInitialized(); //Not Necessary BUT KEPT
  await WindowManager.instance.setResizable(false);

  await WindowManager.instance.setMinimumSize(const Size(200,  200)); // Minimum size
  await WindowManager.instance.setMaximumSize(const Size(800,  800)); // Maximum size

  // setting min and max with the same size to prevent resizing
  //await DesktopWindow.setMinWindowSize(const Size(640,480));
  //await DesktopWindow.setMaxWindowSize(const Size(640,480));
  Bloc.observer = const SimpleBlocObserver();
  blocMain();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget
{
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      home: Welcome(),
      //color: Colors.red,
      debugShowCheckedModeBanner: true,
    );
  }
}