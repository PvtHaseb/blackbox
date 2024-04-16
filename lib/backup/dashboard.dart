// ignore_for_file: sized_box_for_whitespace

import 'package:black_box/const/const.dart';
import 'package:black_box/modules/dashboard/cubit/cubit.dart';
import 'package:black_box/modules/dashboard/cubit/states.dart';
import 'package:black_box/utils/appbar.dart';
import 'package:black_box/models/dashs_textfield.dart';
import 'package:black_box/utils/drawer.dart';
import 'package:black_box/utils/dropdownmenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:black_box/utils/textfield.dart';


List<String> itemsList = <String>['Mouse', 'Keyboard', 'Power Cable', 'VGA Cable', 'HDMI Cable', 'Neon Lamb', 'CRT Screen', 'Case', 'Ethernet'];
List<String> colorList = <String>['Black', 'White', 'Blue', 'Red'];
List<String> brandList = <String>['Microsoft','Hp', 'DELL', 'Fujitsu', 'XO', 'WOLF', 'Tiger', 'Icon', 'MediaTech'];
List<String> destnationList = <String>['Library', 'Corruption Discovery'];

class AdminDashboard extends StatefulWidget
{
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard>
{

String dropdownitemsValue = itemsList.first; // Initialize dropdownValue here
String dropdowncolorValue = colorList.first; // Initialize dropdownValue here
String dropdownbrandValue = brandList.first; // Initialize dropdownValue here
String dropdowndestnationValue = destnationList.first; // Initialize dropdownValue here

TextEditingController serialNumber = TextEditingController();
TextEditingController serialNumberRemover = TextEditingController();
TextEditingController serialNumberReader = TextEditingController();
TextEditingController serialNumberUpdate = TextEditingController();
TextEditingController id = TextEditingController();

TextEditingController returnedItem = TextEditingController();
TextEditingController returnedBrand = TextEditingController();
TextEditingController returnedColor = TextEditingController();
TextEditingController returnedDestnation = TextEditingController();

String? serialNumberText;



  @override
  Widget build(BuildContext context)
  {
    return BlocProvider<DashBoardCubit>(
      create: (BuildContext context) => DashBoardCubit(),
      child: BlocConsumer<DashBoardCubit, DashBoardStates>(
        listener: (context, state){},
        builder: (context, state)
        {
        return SafeArea(
          child: Scaffold(
            appBar: defaultAppBar(appBarTitle: "Admin", appbarColor: Specs().cGray_400),
            drawer: defaultDrawer(context),
            body: 
            // Container(
            //   decoration: const BoxDecoration(
            //     image: DecorationImage(image: AssetImage("assets/images/tmc.png"))
            //   ),
              //child: 
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Column(
                      //ADD
                      children: [
                      Row(
                        children: [
                          const Text("Item:"),
                          const SizedBox(width: 20,),
                          defultDropDownMenu(
                              wordsList: itemsList,
                              dropdownValueDefultValue: dropdownitemsValue,
                              dropDownMenuIcon: const Icon(Icons.arrow_downward),
                              elevationValue: 1,
                              underline: Container(height: 2,color: Colors.deepPurple,),
                              textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              onChangedFunction: (String? value) {setState(() {dropdownitemsValue = value!;});},
                              containerWidth: 110
                            ),
                          const SizedBox(width: 50,),
                              
                          const Text("Brand:"),
                          const SizedBox(width: 20,),
                          defultDropDownMenu(
                              wordsList: brandList,
                              dropdownValueDefultValue: dropdownbrandValue,
                              dropDownMenuIcon: const Icon(Icons.arrow_downward),
                              elevationValue: 1,
                              underline: Container(height: 2,color: Colors.deepPurple,),
                              textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              onChangedFunction: (String? value) {setState(() {dropdownbrandValue = value!;});},
                              containerWidth: 100
                            ),
                          const SizedBox(width: 50,),
                              
                          const Text("Color:"),
                          const SizedBox(width: 20,),
                          defultDropDownMenu(
                              wordsList: colorList,
                              dropdownValueDefultValue: dropdowncolorValue,
                              dropDownMenuIcon: const Icon(Icons.arrow_downward),
                              elevationValue: 1,
                              underline: Container(height: 2,color: Colors.deepPurple,),
                              textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                              onChangedFunction: (String? value) {setState(() {dropdowncolorValue = value!;});},
                              containerWidth: 70,
                            ),
                        ],
                      ),
                      const SizedBox(height: 30,),
                      Row(
                        children: [
                      const Text("S/N:"),
                      const SizedBox(width: 20,),
                      //defaultTextField(containerWidth: 200, textController: serialNumber),
                      Container(
                        width: 200,
                        child: TextField(
                          controller: serialNumber,
                          inputFormatters:[
                          SerialNumberFormatter(), // Applies the custom formatter
                        ],
                          keyboardType: TextInputType.text, // Allows both numbers and letters
                          decoration: const InputDecoration(border: OutlineInputBorder(),),
                          )
                      ),
                      const SizedBox(width: 20,),
                      const Text("Destnation:"),
                      const SizedBox(width: 20,),
                      defultDropDownMenu(
                        dropdownValueDefultValue: dropdowndestnationValue,
                        dropDownMenuIcon: const Icon(Icons.arrow_downward),
                        onChangedFunction: (String? value) {setState(() {dropdowndestnationValue = value!;});},
                        elevationValue: 1,
                        wordsList: destnationList,
                        underline: Container(height: 2,color: Colors.deepPurple,),
                        textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                        containerWidth: 165,
                      ),
                      const SizedBox(width: 70,),
                      ElevatedButton.icon(onPressed: () {DashBoardCubit.get(context).add
                      (
                        brand: dropdownbrandValue,
                        color: dropdowncolorValue,
                        destnation: dropdowndestnationValue,
                        type: dropdownitemsValue,
                        serialNumber: serialNumber.text 
                      );
                      serialNumber.clear(); //clears the textfield text after inserted
                      }, icon: const Icon(Icons.insert_chart), label: const Text("INSERT")
                    ),
                ]
                              ),
                              //ADD
                              const SizedBox(height: 15,),
                              Container( //SEPERATOR
                width: double.infinity,
                height: 1,
                child: const ColoredBox(color: Colors.black),
                              ),
                              //DELETE
                              const SizedBox(height: 60,),
                              //DELETE
                              Row(
                children: [
                      const Text("S/N:"),
                      const SizedBox(width: 20,),
                      //defaultTextField(containerWidth: 200, textController: serialNumber),
                      Container(
                        width: 200,
                        child: TextField(
                          controller: serialNumberRemover,
                          inputFormatters:[
                          SerialNumberFormatter(), // Applies the custom formatter
                        ],
                          keyboardType: TextInputType.text, // Allows both numbers and letters
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("rm item via sn")
                            ),
                          )
                      ),
                      const SizedBox(width: 25,),
                      ElevatedButton.icon(onPressed: ()
                      {
                        //DashBoardCubit.get(context).
                        serialNumber.clear(); //clears the textfield text after inserted
                      },
                      icon: const Icon(Icons.delete), label: const Text("DELETE")
                    ),
                  ],
                    ),
                  //DELETE
                  //UPDATE
                              
                  //Still Will BE CHANGED TO TEXTFIELDS INSTEAD OF DROP DOWN MENUS
                  const SizedBox(height: 60,),
                  Container( //SEPERATOR
                    width: double.infinity,
                    height: 1,
                    child: const ColoredBox(color: Colors.black),
                  ),
                  //UPDATE
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                    const Text("S/N:"),
                    const SizedBox(width: 20,),
                      Container(
                        width: 200,
                        child: TextField(
                          controller: serialNumberReader,
                          inputFormatters:[
                          SerialNumberFormatter(), // Applies the custom formatter
                        ],
                          keyboardType: TextInputType.text, // Allows both numbers and letters
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("rd item via sn")
                            ),
                          )
                      ),
                      const SizedBox(width: 25,),
                      ElevatedButton.icon(onPressed: ()
                      {
                        serialNumberText = serialNumberReader.text;
                        DashBoardCubit.get(context).fetchBySN(serialNumberText!);
                        //serialNumber.clear(); //clears the textfield text after inserted
                      },
                      icon: const Icon(Icons.delete), label: const Text("READ")
                    ),
                    ],
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Row(
                        children: [
                          const Text("Item:"),
                          const SizedBox(width: 10,),

                          FutureBuilder<String>(
                            future: DashBoardCubit.get(context).printItemDetails(), // Assuming serialNumberText is available
                            builder: (BuildContext context, AsyncSnapshot<String> snapshot)
                            {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const CircularProgressIndicator(); // Show loading indicator while waiting
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}'); // Show error message if any
                                } else {
                            return defaultTextField(
                                  containerWidth: 155,
                                  suffixIcon: const Icon(Icons.emoji_objects),
                                  textController: TextEditingController(text: snapshot.data ?? ''), //here
                                );
                              }
                            }),
                      
                          const SizedBox(width: 30,),

                          const Text("Brand:"),
                          const SizedBox(width: 10,),
                          defaultTextField(
                            containerWidth: 140,
                            suffixIcon: const Icon(Icons.backup_table_rounded),
                            textController: returnedBrand,
                          ),
                          const SizedBox(width: 30,),
                                
                          const Text("Color:"),
                          const SizedBox(width: 10,),
                          defaultTextField(
                            containerWidth: 105,
                            suffixIcon: const Icon(Icons.color_lens),
                            textController: returnedColor,
                          ),
                            const SizedBox(width: 40,),
                            Container(
                              width: 100,
                              height: 60,
                              child: TextField(
                                controller: id,
                                enabled: false,
                                decoration: const InputDecoration(border: OutlineInputBorder(),),
                              ),
                            ),
                        ],
                      ),
                    ],
                      ),
                    const SizedBox(height: 30,),
                      Row(
                        children: [
                      const Text("S/N:"),
                      const SizedBox(width: 20,),
                      //defaultTextField(containerWidth: 200, textController: serialNumber),
                      Container(
                        width: 200,
                        child: TextField(
                          controller: serialNumberUpdate,
                          inputFormatters:[
                          SerialNumberFormatter(), // Applies the custom formatter
                        ],
                          keyboardType: TextInputType.text, // Allows both numbers and letters
                          decoration: const InputDecoration(border: OutlineInputBorder(),),
                          )
                      ),
                      const SizedBox(width: 20,),
                      const Text("Destnation:"),
                      const SizedBox(width: 20,),
                      defaultTextField(
                            containerWidth: 200,
                            suffixIcon: const Icon(Icons.emoji_objects),
                            textController: returnedDestnation,
                          ),
                      const SizedBox(width: 70,),
                      ElevatedButton.icon(onPressed: () {
                        //DashBoardCubit.get(context).add
                      // (
                      //   brand: dropdownbrandValue,
                      //   color: dropdowncolorValue,
                      //   destnation: dropdowndestnationValue,
                      //   type: dropdownitemsValue,
                      //   serialNumber: serialNumber.text 
                      // );
                      serialNumberUpdate.clear(); //clears the textfield text after inserted
                      }, icon: const Icon(Icons.insert_chart), label: const Text("UPDATE")
                    ),
                ]
                              ),
                  ],
                ),
                ]),
                    ),
            ),
        );
      },
    ),
  );
    //);
  }
}