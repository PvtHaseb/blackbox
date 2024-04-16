// ignore_for_file: avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:black_box/modules/login/login.dart';
import 'package:black_box/utils/appbar.dart';
import 'package:flutter/material.dart';

double width = 500;
double height = 50;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: defaultAppBar(
          appBarTitle: "SignUp",
          backwordArrow: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
          elevation: 3,
          ),

      body: Center(
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            "assets/images/sc_assault.jpg",
                            width: 250,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                        ),
                  ),

                  const SizedBox(height: 25,),

                  Container(
                    width: width,
                    height: height,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.account_circle)
                      ),
                    ),
                  ),

                  const SizedBox(height:  10),

                  Container(
                    width: width,
                    height: height,
                    child: const TextField(
                      decoration: InputDecoration(
                        labelText: 'Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email)
                      ),
                    ),
                  ),

                  const SizedBox(height:  10),

                  Container(
                    width: width,
                    height: height,
                    child:  TextField(
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        border: const OutlineInputBorder(),
                        prefixIcon: const Icon(Icons.password),
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
                              )
                      ),
                    ),
                  ),

                  const SizedBox(height:  20),

                  ElevatedButton(
                    onPressed: () {
                      // Handle signup logic here
                    },
                    child: const Text('SignUp', style: TextStyle(color: Colors.black)),
                  ),

                  const SizedBox(height:  20),

                  TextButton(
                    onPressed: () {
                      Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const LoginScreen()),
                            );
                    },
                    child: const Text('Already have an account? Login', style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}