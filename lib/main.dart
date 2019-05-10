import 'dart:async';

import 'package:FlutterWebSample/cut_circle_text.dart';
import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Raleway',
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _spinnerText;
  Timer _timerSpinner;
  List<String> _spinnerTextList = [
    'Welcome to',
    'Bienvenue à',
    'Willkommen zu',
    'Bienvenido a',
    'आपका स्वागत है',
    'Welcome to',
  ];

  @override
  void initState() {
    super.initState();
    _spinnerText = 'Hello!';
    startSpinnerText();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Builder(builder: (BuildContext context) {
        return _buildPageView(context);
      }),
    );
  }

  Widget _buildPageView(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.grey[900], Colors.grey[800]],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: <Widget>[
          buildCutCircle(
              [Colors.purpleAccent, Colors.deepPurpleAccent, Colors.blue]),
          CutCircleText(context, _spinnerText),
        ],
      ),
    );
  }

  Container buildCutCircle(List<Color> gradients) {
    return Container(
      transform: Matrix4.translationValues(-125.0, -150.0, 0.0),
      width: 350.0,
      height: 350.0,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: gradients,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
    );
  }

  void startSpinnerText() {
    int i = 0;
    const oneSec = const Duration(seconds: 1);
    _timerSpinner = Timer.periodic(oneSec, (Timer t) {
      setState(() {
        if (i < _spinnerTextList.length) {
          this._spinnerText = _spinnerTextList.elementAt(i++);
        } else {
          i = 0;
        }
      });
    });
  }
}
