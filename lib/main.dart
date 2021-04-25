import 'package:flutter/material.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:agro_cart/Pages/first_pg.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Agrocart mobile",
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.purple[700],
          accentColor: Colors.black),
      debugShowCheckedModeBanner: false,
      // home: LandingPage(),
      home: Welcome(),
    );
  }
}

class Welcome extends StatefulWidget {
  @override
  WelcomeState createState() => WelcomeState();
}

class WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    print("inside build");
    var size = MediaQuery.of(context).size;
    return SplashScreen.navigate(
      name: "assets/agro.flr",
      // onSuccess: (_) {
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>FirstPg()));
      // },
      // onError: (e, s) {},
      next: (_) => FirstPg(),
      height: size.height,
      startAnimation: '1',
      endAnimation: '0.7',
      loopAnimation: 'agro',
      backgroundColor: Colors.black,
      until: () => Future.delayed(Duration(milliseconds: 1300)),
    );
  }
}
