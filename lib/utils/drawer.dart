// ignore_for_file: avoid_print, unused_import

import 'package:black_box/const/const.dart';
import 'package:black_box/const/about_info.dart';
import 'package:black_box/modules/dashboard/dashboard.dart';
import 'package:black_box/modules/home/home%20-%20Copy.dart';
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
                  image: AssetImage("assets/images/background2.jpg"),
                  fit: BoxFit.cover //BACKground IMAGE of the user Profile.
                  ),
            ),
            accountName: Text("الكلية العسكرية التكنولوجية", textAlign: TextAlign.right,
                style: TextStyle(
                  color: Specs().cBlack,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),),
            currentAccountPictureSize: const Size.square(85),
            currentAccountPicture: const CircleAvatar(
                radius: 55,
                backgroundImage: AssetImage("assets/images/NewLogo.png") //USER Profile IMAGE.
                ),
                accountEmail: null,
          ),
          ListTile(
              title: const Text("الصفحة الرئيسية", textAlign: TextAlign.right,),
              leading: const Icon(Icons.home),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()),);
              }),
          ListTile(
              title: const Text("صفحة المسؤول", textAlign: TextAlign.right,),
              leading: const Icon(Icons.admin_panel_settings_rounded),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminDashboard()),);
              }),
          ListTile(
              title: const Text("الوضع المظلم", textAlign: TextAlign.right,),
              leading: const Icon(Icons.dark_mode),
              onTap: () {}),
          ListTile(
              title: const Text("حول البرنامج", textAlign: TextAlign.right,),
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
              title: const Text("تسجيل خروج", textAlign: TextAlign.right,),
              leading: const Icon(Icons.logout),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const Welcome()),);
              }),
          const SizedBox(height: 20,),
          const Center(
            //margin: EdgeInsets.only(bottom: 12, left: 17),
            child: Text("الكلية العسكرية التكنولوجية® 2024", textAlign: TextAlign.right, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          )
        ]),
  ));
}
