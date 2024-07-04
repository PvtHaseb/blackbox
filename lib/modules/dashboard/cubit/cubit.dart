// ignore_for_file: unused_local_variable, dead_code

import 'package:black_box/models/database/db.dart';
import 'package:black_box/models/database/db_functions.dart';
import 'package:black_box/models/database/db_init.dart';
import 'package:black_box/modules/dashboard/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

Isar isar = DBinit.isar;

class DashBoardCubit extends Cubit<DashBoardStates>
{
DashBoardCubit() : super(InitializeDashBoardState());
static DashBoardCubit get(context) => BlocProvider.of(context);

Future<void> add({
  String? type,               //Type Column  //not required cause i may but it in a null value
  String? brand,              //Brand Column  //not required cause i may but it in a null value
  String? color,              //Color Column  //not required cause i may but it in a null value
  String? serialNumber,       //SN Column  //not required cause i may but it in a null value
  String? destnation,         //Dest Column  //not required cause i may but it in a null value
})
async {
  final item = Items()..
  itemType = type..
  brand = brand..
  color = color..
  serialNumber = serialNumber..
  destnation = destnation;
  DBops().addItem(item);
  emit(AddDashBoardState());  
}

//PART 1
Future<List<Items>> fetchBySN(String serialNumberText) async
{
  DBops().fetchItems();
  final items = await isar.items
  .where()
  .filter()
  .serialNumberEqualTo(serialNumberText)
  .findAll();
  return items;
}
//PART 2
Future<String> printItemDetails({String? serialNumberText}) async {
  final items = await fetchBySN(serialNumberText!);
  final item = items[0]; // Assuming you want the first item that matches
  String itemType = item.itemType ?? '';
  String brand = item.brand ?? '';
  String color = item.color ?? '';
  String destnation = item.destnation ?? '';
  return itemType + brand + color + destnation;
  // Now you can use these variables as needed
  emit(ReadDashBoardState());  
}


void update()
{
    
}

Future<void> delete({int? id}) async
{
  
  DBops().deleteItem(id!);
  emit(AddDashBoardState());  
}

}