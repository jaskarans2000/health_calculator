import 'package:flutter/material.dart';

class BmrScreen extends StatefulWidget {
  @override
  _BmrScreenState createState() => _BmrScreenState();
}

class _BmrScreenState extends State<BmrScreen> {
  double _bmi;
  List<String> gender=["Male","Female"];
  String selectedgender="Male";
  final TextEditingController agecontroller=new TextEditingController();
  final TextEditingController weightcontroller=new TextEditingController();
  final TextEditingController heightcontroller=new TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment.topCenter,

      child: new ListView(

        children: <Widget>[
          new Image.asset("images/bmr.jpeg",
            width: 100.0,
            height: 100.0,
            alignment: Alignment.topCenter,),
          new Container(
            color: Colors.blueGrey.shade200,
            child: new Column(
              children: <Widget>[
               Padding(
                 padding: const EdgeInsets.only(top:10.0),
                 child: DropdownButton<String>(
                     value: selectedgender,
                     items: gender.map((String item){
                       return  DropdownMenuItem<String>(
                         value: item,
                           child: Text(item));
                     }).toList(),
                     onChanged: (String selected){
                       setState(() {
                         this.selectedgender=selected;
                       });
                     }),
               ) ,
              new TextField(
                  controller:agecontroller,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: "Age",
                      hintText: "in years",
                      icon: Icon(Icons.person)
                  ),
                ),
                new TextField(
                  controller:heightcontroller,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: "Height",
                      hintText: "in cm",
                      icon: Icon(Icons.assessment)
                  ),
                ),
                new TextField(
                  controller:weightcontroller,
                  keyboardType: TextInputType.number,
                  decoration: new InputDecoration(
                      labelText: "Weight",
                      hintText: "in Kgs",
                      icon: Icon(Icons.line_weight)
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),),
                new RaisedButton(onPressed: calculate,
                    color: Colors.pink,

                    child: new Text("Calculate",style: new TextStyle(color: Colors.white),)
                ),
              ],
            ),
          ),

          Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: new Text(

                (heightcontroller.text.isEmpty &&weightcontroller.text.isEmpty && agecontroller.text.isEmpty )?"" :"Your BMR: ${_bmi.toStringAsFixed(1)} kcal/24hrs",
                style: new TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.w500),
              ),
            ),
          ),
         ],

      ),
    );
  }

  calculate() {
    setState(() {
      if(heightcontroller.text.isNotEmpty && double.parse(heightcontroller.text)>0){
        if(weightcontroller.text.isNotEmpty && double.parse(weightcontroller.text)>0){
          if(agecontroller.text.isNotEmpty &&  double.parse(agecontroller.text)>0){
            double height=double.parse(heightcontroller.text);
            double weight=double.parse(weightcontroller.text);
            double age=double.parse(agecontroller.text);
            if(selectedgender=="Male"){
              _bmi=66.47+(13.7*weight)+(5*height)-(6.8*age);
            }
            else{
              _bmi=655.1+(9.6*weight)+(1.8*height)-(4.7*age);
            }
          }
        }
      }
    });
  }
}
