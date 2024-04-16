// ignore_for_file: unused_import

import 'package:black_box/modules/print/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';


class PrintCubit extends Cubit<PrintStates> {
  PrintCubit() : super(InitialPrintState());

  static PrintCubit get(context) => BlocProvider.of(context);

}