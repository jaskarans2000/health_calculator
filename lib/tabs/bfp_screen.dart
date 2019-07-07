import 'package:flutter/material.dart';

class BfpScreen extends StatefulWidget {
  @override
  _BfpScreenState createState() => _BfpScreenState();
}

class _BfpScreenState extends State<BfpScreen> {
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
          new Image.asset("images/bodyfat.jpg",
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

          Padding(
            padding: const EdgeInsets.all(12.0),
            child: new Text(

              (heightcontroller.text.isEmpty &&weightcontroller.text.isEmpty && agecontroller.text.isEmpty )?"" :"Your Body Fat Percentage: ${_bmi.toStringAsFixed(1)}",
              style: new TextStyle(color: Colors.blue,fontSize: 30,fontWeight: FontWeight.w500),
            ),
          ),
        ],

      ),
    );
  }

  calculate() {
    double bfp;
    setState(() {
      if(heightcontroller.text.isNotEmpty && double.parse(heightcontroller.text)>0){
        if(weightcontroller.text.isNotEmpty && double.parse(weightcontroller.text)>0){
          if(agecontroller.text.isNotEmpty &&  double.parse(agecontroller.text)>0){
            double height=double.parse(heightcontroller.text);
            double weight=double.parse(weightcontroller.text);
            double age=double.parse(agecontroller.text);
            if(selectedgender=="Male"){
              bfp=((weight)/(height*height));
              _bmi=(1.20*bfp)+(0.23*age)-16.2;
            }
            else{
              bfp=((weight)/(height*height));
              _bmi=(1.20*bfp)+(0.23*age)-5.4;
            }
          }
        }
      }
    });
  }
}
