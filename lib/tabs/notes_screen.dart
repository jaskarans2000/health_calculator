import 'package:flutter/material.dart';

import 'breakfast_screen.dart';
import 'dinner_screen.dart';
import 'lunch_screen.dart';

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> with SingleTickerProviderStateMixin {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body:Column(
           children: <Widget>[
             Card(
               color: Colors.pinkAccent,
               child: ListTile(
                 title: Text("Breakfast",
                 style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                 onTap:(){
                   var router=MaterialPageRoute(builder: (BuildContext context){
                     return BreakfastScreen();
                   });
                   Navigator.of(context).push(router);
                 },
               ),
               margin: const EdgeInsets.all(10.0),
               elevation: 4.5,
             ),
             Card(
               color: Colors.pinkAccent,
               child: ListTile(
                 title: Text("Lunch",
                     style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                 onTap:(){
                   var router=MaterialPageRoute(builder: (BuildContext context){
                     return LunchScreen();
                   });
                   Navigator.of(context).push(router);
                 },
               ),
               margin: const EdgeInsets.all(10.0),
               elevation: 4.5,
             ),
             Card(
               color: Colors.pinkAccent,
               child: ListTile(
                 title: Text("Dinner",
                     style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
                 onTap:(){
                   var router=MaterialPageRoute(builder: (BuildContext context){
                     return DinnerScreen();
                   });
                   Navigator.of(context).push(router);
                 },
               ),
               margin: const EdgeInsets.all(10.0),
               elevation: 4.5,
             ),

           ],
         )
    );
  }
}
