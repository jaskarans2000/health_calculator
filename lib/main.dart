import 'package:flutter/material.dart';

import 'home.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.pinkAccent,
    ),
    title: "Health calculator",
    home: Home(),
  ));
}


