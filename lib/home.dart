import 'package:flutter/material.dart';
import 'package:health_calculator/tabs/bfp_screen.dart';
import 'package:health_calculator/tabs/bmi_screen.dart';
import 'package:health_calculator/tabs/bmr_screen.dart';
import 'package:health_calculator/tabs/notes_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  TabController _tabController;


  @override
  void initState() {
    super.initState();
    _tabController=TabController(length: 4, vsync: this,initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Health Calculator"),
        centerTitle: true,
        elevation: 0.7,
        bottom: TabBar(
            controller: _tabController,
            indicatorColor: Colors.white,
            tabs: <Widget>[
              Tab(
                text: "BMI",
              ),
              Tab(
                text: "BMR",
              ),
              Tab(
                text: "BFP",
              ),
              Tab(
                icon: Icon(Icons.border_color),
              )
            ]),
      ),
      body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            BmiScreen(),
            BmrScreen(),
            BfpScreen(),
            NotesScreen()
          ]),
    );
  }
}
