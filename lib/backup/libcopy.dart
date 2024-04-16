// ignore_for_file: unused_import

import 'package:black_box/models/database/db_functions.dart';
import 'package:black_box/models/database/db.dart';
import 'package:black_box/modules/library/cubit/cubit.dart';
import 'package:black_box/modules/library/cubit/states.dart';
import 'package:black_box/utils/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Library extends StatelessWidget {
  const Library({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LibraryCubit>(
      create: (BuildContext context) => LibraryCubit(),
      child: BlocConsumer<LibraryCubit, LibraryCubitStates>(
        listener: (context, state){},
        builder: (context, state){
        return SafeArea(
          child: Scaffold(
            appBar: defaultAppBar(backwordArrow: IconButton(onPressed: (){Navigator.pop(context);}, icon: const Icon(Icons.arrow_back)),
            appBarTitle: "Library", elevation: 3),
            
            body: FutureBuilder<List<Items>>(
                    future: DBops().fetchItems(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        return DataTable
                        (
                          columns: const <DataColumn>
                          [
                            DataColumn(label: Text('item')),
                            DataColumn(label: Text('brand')),
                            DataColumn(label: Text('color')),
                            DataColumn(label: Text('serial number')),
                            DataColumn(label: Text('destnation')),
                          ],
                          rows: snapshot.data!
                              .map((Items item) => DataRow
                              (
                                    cells: <DataCell>[
                                      DataCell(Text(item.itemType ?? '')),
                                      DataCell(Text(item.brand ?? '')),
                                      DataCell(Text(item.color ?? '')),
                                      DataCell(Text(item.serialNumber ?? '')),
                                      DataCell(Text(item.destnation ?? '')),
                                    ],
                                  ))
                              .toList(),
                        );
                      }
                    },
                  ),
          ),
        );
      }),
    );
  }
}