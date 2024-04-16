// ignore_for_file: unused_import

import 'package:black_box/const/const.dart';
import 'package:black_box/modules/library/cubit/states.dart';
import 'package:black_box/modules/print/cubit/cubit.dart';
import 'package:black_box/modules/print/cubit/states.dart';
import 'package:black_box/utils/appbar.dart';
import 'package:black_box/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PrintScreen extends StatelessWidget {
  const PrintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PrintCubit>(
        create: (BuildContext context) => PrintCubit(),
        child: BlocConsumer<PrintCubit, PrintStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return SafeArea(
                  child: Scaffold(
                appBar: defaultAppBar(appBarTitle: "Print & Export", elevation: 3, appbarColor: Specs().cGray_400),
                body:  Padding(padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Row(
                      children:
                      [
                        defaultButton(btnText: "Export As PDF\n\t\t\t\t\tLibrary", btnColor: Specs().cBlue_400,btnFunction: (){}),
                        const SizedBox(width: 50,),
                        defaultButton(btnText: "Export As EXCEL\n\t\t\t\t\t\t\tLibrary", btnColor: Specs().cBlue_400,btnFunction: (){}),
                        const SizedBox(width: 50,),
                        defaultButton(btnText: "Export As DOCX\n\t\t\t\t\t\t\tLibrary", btnColor: Specs().cBlue_400,btnFunction: (){}),
                      ],
                    ),
                    const SizedBox(height: 60,),
                    Row(
                      children:
                      [
                        defaultButton(btnText: "\t\t\t\tExport As PDF\n\t\t\t\t\t\t\tCorruption Discovery", btnColor: Specs().cBlue_400, btnFunction: (){}),
                        const SizedBox(width: 50,),
                        defaultButton(btnText: "\t\t\t\tExport As EXCEL\n\t\t\t\t\t\t\tCorruption Discovery", btnColor: Specs().cBlue_400,btnFunction: (){}),
                        const SizedBox(width: 50,),
                        defaultButton(btnText: "\t\t\t\tExport As DOCX\n\t\t\t\t\t\t\tCorruption Discovery", btnColor: Specs().cBlue_400,btnFunction: (){}),
                      ],
                    ),
                    const SizedBox(height: 60,),
                    Row(
                      children:
                      [
                        defaultButton(btnText: "Print Now", btnColor: Specs().cBlue_400, btnFunction: (){}),
                      ],
                    ),
                  ],
                ),
                ),
              ),
            );
          }
        )
      );
  }
}
