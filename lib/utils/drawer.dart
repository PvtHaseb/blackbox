// ignore_for_file: avoid_print

import 'package:black_box/const/const.dart';
import 'package:black_box/const/about_info.dart';
import 'package:black_box/modules/dashboard/dashboard.dart';
import 'package:black_box/modules/home/home.dart';
import 'package:black_box/modules/splash/welcome.dart';
import 'package:flutter/material.dart';

Widget defaultDrawer(BuildContext context){
  return SafeArea(
      child: Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/cod.jpg"), fit: BoxFit.cover //BACKground IMAGE of the user Profile.
                  ),
            ),
            accountName: Text("Shadow Company",
                style: TextStyle(
                  color: Specs().cGray_200,
                  fontWeight: FontWeight.bold
                )),
            currentAccountPictureSize: const Size.square(99),
            currentAccountPicture: const CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage("assets/images/sc_assault.jpg") //USER Profile IMAGE.
                ),
                accountEmail: null,
          ),
          ListTile(
              title: const Text("Home"),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()),);
              }),
          ListTile(
              title: const Text("Admin"),
              leading: const Icon(Icons.admin_panel_settings_rounded),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminDashboard()),);
              }),
          ListTile(
              title: const Text("Dark mode"),
              leading: const Icon(Icons.dark_mode),
              onTap: () {}),
          ListTile(
              title: const Text("About"),
              leading: const Icon(Icons.campaign),
              onTap: () {
                showAlertDialog(context);
                //1
          //       showPopover(
          //   context: context,
          //   bodyBuilder: (context) => const ListItems(),
          //   onPop: () => print('Popover was popped!'),
          //   direction: PopoverDirection.bottom,
          //   width: 200,
          //   height: 400,
          //   arrowHeight: 15,
          //   arrowWidth: 30,
          // );
          //2
              //MaterialPageRoute(builder: (context) => const ItemsMenu()); 
          //3
              // showPopover(context: context, bodyBuilder: (context) => const ItemsMenu(),
                // width: 100,
                // height: 85,
              }),
          ListTile(
              title: const Text("Logut"),
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()),);
              }),
          Container(
            margin: const EdgeInsets.only(bottom: 12, left: 17),
            child: const Text("Shadow Company® 2024",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )
        ]),
  ));
}
