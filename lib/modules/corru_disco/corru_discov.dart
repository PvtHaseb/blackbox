// ignore_for_file: unused_import

import 'package:black_box/const/const.dart';
import 'package:black_box/models/database/db_functions.dart';
import 'package:black_box/models/database/db.dart';
import 'package:black_box/modules/corru_disco/cubit/cubit.dart';
import 'package:black_box/modules/corru_disco/cubit/states.dart';
import 'package:black_box/utils/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isar/isar.dart';

class CorruptionDiscovery extends StatelessWidget
{
  const CorruptionDiscovery({super.key});

  @override
  Widget build(BuildContext context)
  {
    return BlocProvider<CorruptionDiscoveryCubit>(
      create: (BuildContext context) => CorruptionDiscoveryCubit(),
      child: BlocConsumer<CorruptionDiscoveryCubit, CorruptionDiscoveryStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return SafeArea(
              child: Scaffold(
                appBar: defaultAppBar(appBarTitle: "Corruption Discovery", elevation: 3, appbarColor: Specs().cGray_400,),

                body: FutureBuilder<List<Items>>(
                  future: isar.items.where().filter().destnationEqualTo("Corruption Discovery",).findAll(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    } else if (snapshot.hasError) {
                      return Text('Error: ${snapshot.error}');
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: DataTable(
                          columns: const <DataColumn>[
                            DataColumn(label: Text('ID')),
                            DataColumn(label: Text('Item')),
                            DataColumn(label: Text('Brand')),
                            DataColumn(label: Text('Color')),
                            DataColumn(label: Text('Serial number')),
                            DataColumn(label: Text('Destnation')),
                          ],
                          rows: snapshot.data!
                              .map((Items item) => DataRow(
                                    cells: <DataCell>[
                                      //DataCell(Text(NumberConversion().toArNumber(item.id))),
                                      DataCell(Text(item.id.toString())),
                                      DataCell(Text(item.itemType ?? '')),
                                      DataCell(Text(item.brand ?? '')),
                                      DataCell(Text(item.color ?? '')),
                                      DataCell(Text(item.serialNumber ?? '')),
                                      DataCell(Text(item.destnation ?? '')),
                                    ],
                                  ))
                              .toList(),
                        ),
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
