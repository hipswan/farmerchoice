import 'dart:ui';

import 'package:farmerchoice/clip_shadow_path.dart';
import 'package:farmerchoice/landing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: size.width,
          // color: Color(0xff229064),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Color(0xff229064),
                Color(0xff25c384),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Farmers Choice text
              Container(
                padding: EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Text(
                  '''Farmer's 
            Choice''',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 50.0,
                  ),
                ),
              ),
              Expanded(
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: ClipShadowPath(
                        shadow: BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, -5),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                        clipper: BottomWaveClipper(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xffF2FFFA),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                0.0,
                              ),
                              topRight: Radius.circular(
                                0.0,
                              ),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 120,
                              left: 20.0,
                              right: 20.0,
                            ),
                            child: Form(
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                      ),
                                      validator: (value) {
                                        if (value.trim().isEmpty) {
                                          return 'Please Enter Your Password';
                                        }
                                        if (!value
                                            .trim()
                                            .contains(new RegExp(r'[0-9]'))) {
                                          return 'Please Include Number';
                                        }
                                        //  if (!value.contains(new RegExp(r'[@&^*$#!_]'))) {
                                        //   return 'Please Include Special Charater';
                                        // }
                                        if (!(value.trim().length >= 6)) {
                                          return 'Please Enter Password with greater length';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'username',
                                        filled: true,
                                        fillColor: Color(0xffDEF9EF),
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 6.0, top: 8.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //Login Password Text Field
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      style: TextStyle(
                                        fontSize: 15.0,
                                        color: Colors.black,
                                      ),
                                      validator: (value) {
                                        if (value.trim().isEmpty) {
                                          return 'Please Enter Your Password';
                                        }
                                        if (!value
                                            .trim()
                                            .contains(new RegExp(r'[0-9]'))) {
                                          return 'Please Include Number';
                                        }
                                        //  if (!value.contains(new RegExp(r'[@&^*$#!_]'))) {
                                        //   return 'Please Include Special Charater';
                                        // }
                                        if (!(value.trim().length >= 6)) {
                                          return 'Please Enter Password with greater length';
                                        }
                                        return null;
                                      },
                                      decoration: InputDecoration(
                                        border: InputBorder.none,
                                        hintText: 'password',
                                        filled: true,
                                        fillColor: Color(0xffDEF9EF),
                                        contentPadding: const EdgeInsets.only(
                                            left: 14.0, bottom: 6.0, top: 8.0),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      style: ButtonStyle(
                                          backgroundColor:
                                              MaterialStateProperty.all(
                                                  Color(0xff26C485))),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Landing(),
                                          ),
                                        );
                                      },
                                      child: Text('Submit'),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.all(
                                        8.0,
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/login.svg',
                                        width: size.width * 0.7,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 30,
                      right: 0,
                      left: 0,
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffffba49),
                            borderRadius: BorderRadius.circular(
                              50.0,
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class BottomWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    // Draw a straight line from current point to the bottom left corner.

    path.lineTo(0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    var firstControlPoint = Offset(size.width - 15, 40);
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, size.width - 45, 40);
    // Draw a straight line from current point to the top right corner.
    path.lineTo(40, 40);
    var secondControlPoint = Offset(0.0, 45);
    path.quadraticBezierTo(
        secondControlPoint.dx, secondControlPoint.dy, 0.0, 100);
    // Draws a straight line from current point to the first point of the path.
    // In this case (0, 0), since that's where the paths start by default.
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
