import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Area Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Area Calculator'),
        ),
        body: AreaCalculator(),
      ),
    );
  }
}

class AreaCalculator extends StatefulWidget {
  @override
  _AreaCalculatorState createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {

  List<String> shapes = ['Rectangle', 'Triangle'];
  String currentShape;
  String result = '0';
  double width = 0;
  double height = 0;

  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();

  @override
  void initState() {

    super.initState();
    result = '0';
    currentShape = 'Rectangle';
    widthController.addListener(updateWidth);
    heightController.addListener(updateHeight);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top:15.0),
      child: Column(children: <Widget>[
        //dropdown
        DropdownButton<String>(
          value: currentShape,
          items: shapes.map((String value) {
            return new DropdownMenuItem<String>(
              value: value,
              child: Text(value,
                style: TextStyle(fontSize: 24.0),)
              );
          }).toList(), 
          onChanged: (shape){
            setState(() {
              currentShape = shape;
            });
          }
        ),
      ]),
    );
  }
}