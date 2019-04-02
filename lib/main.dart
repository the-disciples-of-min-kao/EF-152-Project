import 'dart:core';
import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

String input = '';
List inputArray;
const int meters = 2000;
const int singleW = 14;
const int doubleW = 27;
const int fourW = 50;
const int eightW = 96;
const double fDW = 22.79;
const double denAir = 1.225;
const double CDragA = 1.8;
const saMultiplier = .36;

/* int numRowers;
int spm;
double timeMin;
double totWeight;
double avgH; */
double velocity;
double work;
double wNoLoss;
double weight;
double fDragA;
double force;
double sA;
double potPStroke;
double vMax;
double potTime;

  class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EF 152 Rowing Simulation',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.deepOrange,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => new _HomeState();
}

//This is the homepage
class _HomeState extends State<Home> {
  double width = 0, height = 0;

  void screenSizes() {
    setState((){
      width = MediaQuery.of(context).size.width;
      height = MediaQuery.of(context).size.width;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Rowing Motivation App'),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Container(
          child:
          new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'images/thumbnail.jpg',
                  fit:BoxFit.fill,
                  width: 300.0,
                  height: 300.0,
                ),

                new Text(
                  "EF Rowing Simulation",
                  style: new TextStyle(fontSize:18.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                ),

                new Container(
                  child:
                  new RaisedButton(key:null,
                      color: const Color(0xFFe0e0e0),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Usage()));
                      },
                      child:
                      new Text(
                        "Get Started",
                        style: new TextStyle(fontSize:12.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                      )
                  ),

                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.center,
                  width: 1.7976931348623157e+308,
                  height: 73.0,
                )
              ]

          ),

          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
        ),
      ),

    );
  }
  void buttonPressed(){}
}
class Usage extends StatefulWidget {
  Usage({Key key}) : super(key: key);
  @override
  _UsageState createState() => new _UsageState();
}

class _UsageState extends State<Usage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('How To Use'),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Container(
          child:
          new Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                new Container(
                  child:
                  new Text(
                    "To use this app you must type in your team's 2000m time, each of their heights and weights and the teams average spm",
                    style: new TextStyle(fontSize:40.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                  ),

                  padding: const EdgeInsets.fromLTRB(11.0, 48.0, 60.0, 17.0),
                  alignment: Alignment.topCenter,
                  width: 47.0,
                  height: 535.0,
                ),

                new RaisedButton(key:null,
                    color: const Color(0xFFe0e0e0),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Main()));
                    },
                    child:
                    new Text(
                      "Continue",
                      style: new TextStyle(fontSize:12.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"),
                    )
                )
              ]

          ),

          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
        ),
      ),

    );
  }
  void buttonPressed(){}
}

class Main extends StatefulWidget {
  Main({Key key}) : super(key: key);
  @override
  _MainState createState() => new _MainState();
}

class _MainState extends State<Main> {
    @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Data Input'),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Container(
          child:
          new Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Usage: "
                     + "number of rowers, 2000 meter race time in mins, average strokes per minute, total weight, average height",
                  style: new TextStyle(fontSize:20.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                ),

                new Container(
                  child:
                  new TextField(
                    style: new TextStyle(fontSize:14.0,
                        color: const Color(0xFFff0000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                    onChanged: (text) {
                      input = text;
                      inputArray = input.split(',');
                      calculations(int.parse(inputArray[0]), double.parse(inputArray[1]), int.parse(inputArray[2]), double.parse(inputArray[3]), double.parse(inputArray[4]));
                    },
                  ),

                  padding: const EdgeInsets.all(0.0),
                  alignment: Alignment.topCenter,
                  width: 1.7976931348623157e+308,
                  height: 50.0,
                ),

                new RaisedButton(key:null,
                    color: const Color(0xFFe0e0e0),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Results()));
                    },
                    child:
                    new Text(
                      "Calculate",
                      style: new TextStyle(fontSize:12.0,
                          color: const Color(0xFF000000),
                          fontWeight: FontWeight.w200,
                          fontFamily: "Roboto"),
                    )
                )
              ]

          ),

          padding: const EdgeInsets.all(0.0),
          alignment: Alignment.center,
          width: 1.7976931348623157e+308,
          height: 1.7976931348623157e+308,
        ),
      ),

    );
  }
  void buttonPressed(){}

  void calculations(int rowers, double mins, int sPM, double totalWeight, double avgHeight) {
    switch (rowers) {
      case 1:
        weight = totalWeight + singleW;
        break;
      case 2:
        weight = totalWeight + doubleW;
        break;
      case 4:
        weight = totalWeight + fourW;
        break;
      case 8:
        weight = totalWeight + eightW;
    }
    double tSec = 60 * mins;
    velocity = meters / tSec;

    work = 1.0 / 2 * weight * pow(velocity, 2.0);
    sA = sqrt(((totalWeight / rowers) * (avgHeight * 100)) / 3600);

    fDragA=1/2*pow(velocity,2)*denAir*CDragA*sA;

    force = fDW + fDragA;
    wNoLoss = -(-work - force);

    potPStroke = (wNoLoss / tSec) / (sPM * (tSec / 60));

    vMax = sqrt((2 * wNoLoss) / totalWeight);

    potTime = (meters / vMax)/60.0;
  }
}

class Results extends StatefulWidget {
  Results({Key key}) : super(key: key);
  @override
  _ResultsState createState() => new _ResultsState();
}

class _ResultsState extends State<Results> {
  //math function goes here


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Results'),
      ),
      body:
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Center(
          child:
          new Container(
            child:
            new Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  new Text(
                    "Work output: "+ work.toString()+ " Joules.\nWork no losses: " + wNoLoss.toString() + "Joules.\nPotential power/stroke: "+potPStroke.toString()+" Watts.\nMaximum potential velocity: "+ vMax.toString() + " m/s.\n" + "Minimum time for 2k: "+ (potTime).toString()+" minutes.\n",
                    style: new TextStyle(fontSize:24.0,
                        color: const Color(0xFF000000),
                        fontWeight: FontWeight.w200,
                        fontFamily: "Roboto"),
                  ),

                  new RaisedButton(key:null,
                      color: const Color(0xFFe0e0e0),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Main()));
                      },
                      child:
                      new Text(
                        "Again",
                        style: new TextStyle(fontSize:12.0,
                            color: const Color(0xFF000000),
                            fontWeight: FontWeight.w200,
                            fontFamily: "Roboto"),
                      )
                  )
                ]

            ),

            padding: const EdgeInsets.fromLTRB(1.0, 200.0, 1.0, 1.0),
            alignment: Alignment.center,
            width: 1.7976931348623157e+308,
            height: 1.7976931348623157e+308,
          ),

        ),
      ),

    );
  }
  void buttonPressed(){}
}