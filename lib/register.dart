// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graduation/home.dart';
import 'package:graduation/login.dart';


class register extends StatefulWidget {
  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  // var passConfirmController = TextEditingController();
  var phoneController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Stack(
                children: [
                  Image.asset('assets/pic/top1.png'),
                  Image.asset('assets/pic/top2.png'),
                  SafeArea(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 10.0,
                      ),
                      child: Column(
                        children: [
                          Image.asset(
                            'assets/pic/greenlogo.png',
                            width: 150.0,
                            height: 150.0,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'REGISTER',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                          color: Colors.blue[700],
                        ),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      //name
                      TextFormField(
                        controller: nameController,
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          labelText: 'Username',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.alternate_email),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'username CAN NOT be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      //email
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email Address',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Email CAN NOT be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      //password
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.lock),
                          // suffixIcon: Icon(Icons.remove_red_eye),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Password CAN NOT be empty';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: phoneController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'phone number',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.dialpad),
                        ),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'phone CAN NOT be empty';
                          }
                          return null;
                        },
                      ),
                      // TextFormField(
                      //   controller: passwordController,
                      //   obscureText: true,
                      //   decoration: InputDecoration(
                      //     labelText: 'Confirm Password',
                      //     border: OutlineInputBorder(),
                      //     prefixIcon: Icon(Icons.lock),
                      //     // suffixIcon: Icon(Icons.remove_red_eye),
                      //   ),
                      //   validator: (value) {
                      //     if (value!.isEmpty) {
                      //       return 'Password CAN NOT be empty';
                      //     }
                      //     return null;
                      //   },
                      // ),
                      SizedBox(
                        height: 25.0,
                      ),

                      Center(
                        child: Container(
                          width: 160.0,
                          height: 40.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              30.0,
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              colors: [
                                Colors.deepOrangeAccent,
                                Colors.amber,
                              ],
                            ),
                          ),
                          child: MaterialButton(
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => home()),
                                );
                                // gradRegCubit.get(context).userReg(
                                //       name: nameController.text,
                                //       email: emailController.text,
                                //       password: passwordController.text,
                                //       phone: phoneController.text,
                                //     );
                              }
                              print('post');
                              // _reg();
                              // _handleRegister();
                            },
                            child: Text(
                              'REGISTER',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginScreen()),
                            );
                          },
                          child: Text(
                            'Already have an account',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ], //children of column
          ),
        ));
  }
}
