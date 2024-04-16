
import 'package:black_box/modules/library/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LibraryCubit extends Cubit<LibraryCubitStates>{
  LibraryCubit() : super(InitalLibraryState());
  
}