import 'package:black_box/models/database/db_init.dart';
import 'package:isar/isar.dart';
import 'package:black_box/models/database/db.dart';


//Isar Database Object Creation - so we could use an instance of the DataBase.
//And it is Global not in a Spesific class so we don't need to create it in every class.

//late Isar isar; 
final isar = DBinit.isar;

class DBops
{
Isar isar = DBinit.isar;

// C R E A T - I N S E R T - A D D...
Future<void> addItem(String item) async
{
  // Create a new Item Objetc
  final newItem = Items()..itemType = item;

  //Save it to the DataBase
  await isar.writeTxn(() => isar.items.put(newItem));
}

// R E A D
final List<Items> currentItems = [];
Future<List<Items>>? fetchItems() async
{
  // fetch All items
  List<Items> fetchItems = await isar.items.where().findAll(); //returns all of em
  currentItems.clear(); //Clear The items list
  currentItems.addAll(fetchItems); // fetch then add all of em into the list
  return currentItems;
}

// U P D A T E
Future<void> updateItems(int id, String newItem) async
{
  // fetch All items
  final existingItems = await isar.items.get(id);
  
  if (existingItems != null){
    existingItems.itemType = newItem;
    await isar.writeTxn(() => isar.items.put(existingItems));
    await fetchItems();
  }
}

// D E L E T E
Future<void> deleteItems(int id) async
{
  await isar.writeTxn(() => isar.items.delete(id));
  await fetchItems();
}

  static initialize() {}

}