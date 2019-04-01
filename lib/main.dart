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
      home: Home(title: 'Rowing Simulation Home Page'),
    );
  }
}

class Home extends StatelessWidget {
  Home({Key key, this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center (
      child: Container(
        color: Colors.deepOrange,
        alignment: Alignment.center,
        foregroundDecoration: BoxDecoration (
          image: DecorationImage(
              image: ExactAssetImage('images/thumbnail.jpg'),
          ),
          border: Border.all (
              color: Colors.deepOrange,
              width: 8.0,
          ),
        ),
        child: RaisedButton(
            onPressed: null
        ),
      ),
    );
  }
}
/*
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}*/

/*
class _MainPageState extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Card(
        child: Padding (
          padding: EdgeInsets.all(8.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Email:'
                  ),
                  validator: (input) => !input.contains('@') ? 'Not a valid Email' : null,
                  onSaved: (input) => _email = input,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password:'
                  ),
                  validator: (input) => input.length < 8 ? 'Not a valid Email' : null,
                  onSaved: (input) => _password = input,
                  obscureText: true,
                ),
                Row (
                  mainAxisAlignment: Midget>[ainAxisAlignment.end,
                  children: <W
                    Padding (
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton (
                        onPressed: _submit,
                        child: Text('Sign in'),
                      )
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void _submit() {
    if(formKey.currentState.validate()){
      formKey.currentState.save();
      print(_email);
      print(_password);
    }
  }
}
*/