import 'package:isar/isar.dart';

part 'db.g.dart';

@Collection()      //@Collection mean Creating a Table
class Items       //Table name is the same as class name then table name is Items.
{
Id id = Isar.autoIncrement; //ID Column
String? itemType;               //Type Column
String? brand;              //Brand Column
String? color;              //Color Column
String? serialNumber;       //SN Column
String? destnation;         //Dest Column

}