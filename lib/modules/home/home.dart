// ignore_for_file: sized_box_for_whitespace

import 'package:black_box/const/const.dart';
import 'package:black_box/modules/corru_disco/corru_discov.dart';
import 'package:black_box/modules/home/cubit/cubit.dart';
import 'package:black_box/modules/home/cubit/states.dart';
import 'package:black_box/modules/library/lib.dart';
import 'package:black_box/utils/appbar.dart';
import 'package:black_box/utils/button.dart';
import 'package:black_box/utils/drawer.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeCubitStates>(
        listener: (context, state){},
        builder: (context, state){
        return SafeArea(
          child: Scaffold(
            drawer: defaultDrawer(context),
            //appBar: defaultAppBar( title: Text(AppLocalizations.of(context)!.welcome), elevation: 3, appbarColor: Specs().cGray_400),
            appBar: defaultAppBar( appBarTitle: "Library", elevation: 3, appbarColor: Specs().cGray_400),
            body: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: <Widget>[

                      // Localizations.override
                      // (
                      //   context: context,
                      //   locale: const Locale('ar'),
                      // ),

                      Expanded(
                        //flex: 1,
                    child: Container(
                      //color: Specs().cGray_300,
                      height: double.infinity,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 75),
                          child: Container(
                            width: 400,
                            height: 350,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                //child: Image.asset("assets/images/lib4.png")),
                                child: Image.asset("assets/images/Corr_dis.png")),
                          ),
                        ),
                        //const SizedBox(height: 15),
                        defaultButton(
                            btnText: "GET IN!",
                            btnFunction: () {Navigator.push(context,MaterialPageRoute(builder: (context) => const Library()),);},
                            btnColor: Specs().cPurple_150)
                      ]),
                    ),
                  ),
                  // Container(
                  //   color: Colors.black,
                  //   height: double.infinity,
                  //   width: 20,
                  // ),
                  Expanded(
                    //flex: 1,
                    child: Container(
                      //color: Specs().cGray_300,
                      height: double.infinity,
                      child: Column(children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 75),
                          child: Container(
                            width: 400,
                            height: 350,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                //child: Image.asset("assets/images/corru_discov1.png")),
                                child: Image.asset("assets/images/Soldier.png")),
                          ),
                        ),
                        const SizedBox(height: 3),
                        defaultButton(
                            btnText: "HUP IN!",
                            btnFunction: () {Navigator.push(context,MaterialPageRoute(builder: (context) => const CorruptionDiscovery()),);},
                            btnColor: Specs().cPurple_150)
                      ]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
