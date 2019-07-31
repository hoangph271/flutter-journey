import 'dart:async';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
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

const basicColors = [
  Colors.green,
  Colors.red,
  Colors.blue,
  Colors.cyan,
  Colors.black,
];

class _MyHomePageState extends State<MyHomePage> {
  final _colors = new List<Color>();

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      if (_colors.length == 50) {
        _colors.removeRange(0, _colors.length);
      }

      setState(() {
        _colors.add(basicColors[_colors.length % basicColors.length]);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 10,
          runSpacing: 10,
          alignment: WrapAlignment.end,
          crossAxisAlignment: WrapCrossAlignment.end,
          children: _colors
              .map((color) => Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: color,
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Image.asset(
                    'assets/flutter.png',
                    height: 65,
                    width: 65,
                  )))
              .toList(),
        ),
      ),
    );
  }
}
