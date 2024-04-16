
import 'package:black_box/models/database/db_init.dart';
import 'package:isar/isar.dart';
import 'package:black_box/models/database/db.dart';

//Isar Database Object Creation - so we could use an instance of the DataBase.
//And it is Global not in a Spesific class so we don't need to create it in every class.

class DBops
{
Isar isar = DBinit.isar;

// C R E A T - I N S E R T - A D D...
Future<void> addItem(Items newItem) async
{
  //Save it to the DataBase
  isar.writeTxnSync(() => isar.items.putSync(newItem));
}

// R E A D
final List<Items> currentItems = [];
Future<List<Items>> fetchItems() async
{
  // fetch All items
  List<Items> fetchItems = await isar.items.where().findAll(); //returns all of em
  currentItems.clear(); //Clear The items list
  currentItems.addAll(fetchItems); // fetch then add all of em into the list
  return fetchItems;
}

// U P D A T E
Future<void> updateItem(int id, String newItem) async
{
  // fetch All items
  final existingItems = await isar.items.get(id); //
  
  if (existingItems != null){
    existingItems.itemType = newItem;
    isar.writeTxnSync(() => isar.items.putSync(existingItems));
  }
}

// D E L E T E
Future<void> deleteItem(int id) async
{
  isar.writeTxnSync(() => isar.items.deleteSync(id));
}

}