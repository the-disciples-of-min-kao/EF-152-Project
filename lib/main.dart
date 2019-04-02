import 'package:flutter/material.dart';

void main() => runApp(MyApp());

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
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Rowing Motivation App'),
      ),
      body:
      new Container(
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
      new Container(
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
                  style: new TextStyle(fontSize:12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                ),

                padding: const EdgeInsets.fromLTRB(11.0, 48.0, 60.0, 17.0),
                alignment: Alignment.topCenter,
                width: 47.0,
                height: 555.0,
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Main'),
      ),
    );
  }
}