// ignore_for_file: sized_box_for_whitespace, avoid_unnecessary_containers, avoid_print

import 'package:black_box/models/login_checker.dart';
import 'package:black_box/modules/login/cubit/states.dart';
import 'package:black_box/utils/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cubit.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

final usernameController = TextEditingController();
final passwordController = TextEditingController();

bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
      return BlocProvider<LoginCubit>(
        create: (BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state){},
          builder: (context, state){
            return SafeArea(
              child: Scaffold(
              //backgroundColor: Colors.grey,
                        
              // appBar: defaultAppBar(
              //   appBarTitle: "Login",
              //   //appbarColor: Specs().cGray_400
              //   ),
                        
              body: DecoratedBox(
                decoration: const BoxDecoration(
                  image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"), // Replace with your image path
              fit: BoxFit.cover,
                        ),
                ),
                        
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius:  5,
                            blurRadius:  7,
                            offset: const Offset(0,  3),
                          ),
                        ],
                      ),
                        
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: 700,
                          height: 515,
                        
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Image.asset(
                                    "assets/images/sc_assault.jpg",
                                    //"assets/images/tmc.png",
                                    width: 250,
                                    height: 250,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30,),
                              Container(
                                width: 500,
                                //height: ,
                                child: TextField(
                                  onSubmitted: (value) { //value is not necessary just to complete the fun //to make Enter Key Works Fine.
                                  String username = usernameController.text;
                                  String password = passwordController.text;
                                  LoginChecker(context: context).checker(username, password);
                                },
                                  controller: usernameController,
                                  keyboardType: TextInputType.text,
                                  decoration: const InputDecoration(
                                    labelText: 'Username',
                                    border: OutlineInputBorder(),
                                    prefixIcon: Icon(Icons.castle)
                                  ),
                                ),
                              ),
                              const SizedBox(height:  10),
                              Container(
                                width: 500,
                                //height: ,
                                child: TextField(
                                  onSubmitted: (value) { //value is not necessary just to complete the fun //to make Enter Key Works Fine.
                                  String username = usernameController.text;
                                  String password = passwordController.text;
                                  LoginChecker(context: context).checker(username, password);
                                  },
                                  obscureText: _obscureText,
                                  controller: passwordController,
                                  keyboardType: TextInputType.none,
                                  decoration: InputDecoration(
                                      labelText: 'Password',
                                      border: const OutlineInputBorder(),
                                      prefixIcon: const Icon(Icons.password_rounded),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscureText
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscureText = !_obscureText;
                                          });
                                        },
                                      )),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                width: 130,
                                child: defaultButton(btnText: "Login", btnFunction: (){
                                  String user = usernameController.text;
                                  String password = passwordController.text;
                                  LoginChecker(context: context).checker(user, password);
                                })
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
                        ),
            );
          },
        ),
      );
  }
}