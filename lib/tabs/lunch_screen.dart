import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LunchScreen extends StatefulWidget {
  @override
  _LunchScreenState createState() => _LunchScreenState();
}

class _LunchScreenState extends State<LunchScreen> {

  final TextEditingController itemcontroller=new TextEditingController();
  final TextEditingController timecontroller=new TextEditingController();
  final FirebaseDatabase database=FirebaseDatabase.instance;
  DatabaseReference _databaseReference;
  TimeOfDay time=TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    _databaseReference=database.reference().child("Lunch");
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Lunch"),
          centerTitle: true,
        ),
      body: StreamBuilder(
          stream: _databaseReference.onValue,
          builder: (_,stream){
            if(stream.hasData){
              Event eve=stream.data;
              DataSnapshot dataSnapshot=eve.snapshot;
              Map itemmap=dataSnapshot.value;
              List item=itemmap.keys.toList();
              List time=itemmap.values.toList();
              return ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (_,index){
                    Map ti=time[index];
                    if(item[index]!= 'item'){
                      Map ti=time[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.pinkAccent,
                          elevation: 4.5,
                          child: ListTile(
                            title: Text("${item[index]}",
                              style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 22.0),),
                            subtitle: Row(
                              children: <Widget>[
                                Text("${ti["time"].toString().substring(10,15)}",
                                  style: TextStyle(color: Colors.white),),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: Text("${ti["date"]}",
                                    style: TextStyle(color: Colors.white),),
                                )
                              ],
                            ),
                          ),

                        ),
                      );}else{return Container(width: 0.0,height: 0.0,);}
                  });;}
            else{
              return Container(width: 0.0,height: 0.0,);
            }
          }),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: Colors.pinkAccent,
          onPressed: (){
            addLunch();
          }),
    );
  }

  void addLunch() {
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text("Add item"),
            content: Container(
              width: 100.0,
              height: 150.0,
              child: Column(
                children: <Widget>[
                  TextField(
                      controller:itemcontroller,
                      keyboardType: TextInputType.text,
                      decoration: new InputDecoration(
                          labelText: "Item",
                          hintText: "like salad",
                          icon: Icon(Icons.fastfood)
                      )),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0),
                    child: IconButton(
                        icon: Icon(Icons.access_time),
                        onPressed:(){
                          showTime(context);
                        }),
                  )
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(onPressed:()=> Navigator.of(context).pop(), child: Text("Cancel")),
              FlatButton(onPressed: (){
                if(itemcontroller.text.isNotEmpty && time.toString().isNotEmpty){
                  _databaseReference.child(itemcontroller.text).set({
                    "time":time.toString(),
                    "date":DateFormat.yMMMMd().format(DateTime.now())
                  });
                }
                itemcontroller.clear();
                timecontroller.clear();
                Navigator.of(context).pop();
              }, child: Text("Add"))
            ],
          );
        });
  }
  Future showTime(BuildContext context) async{
    TimeOfDay picked=await showTimePicker(
        context: context,
        initialTime: time);
    if(picked!=null && picked!=time){
      setState(() {
        time=picked;
      });
    }
  }

}
