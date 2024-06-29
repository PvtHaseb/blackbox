// ignore_for_file: avoid_unnecessary_containers, file_names, unnecessary_import, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LocalizationBTN extends StatelessWidget {
  const LocalizationBTN({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: 20,
        height: 10,
        child: IconButton(onPressed: (){}, icon: const Icon(Icons.language))
      ),
    );
  }
}