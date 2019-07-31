import 'dart:async';
import 'dart:math';

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

class _MyHomePageState extends State<MyHomePage> {
  var _size = 200.0;
  var _color = Color.fromARGB(255, 125, 125, 125);

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        _size = Random().nextDouble() * 200 + 100;
        _color = Color.fromARGB(Random().nextInt(256), Random().nextInt(256),
            Random().nextInt(256), Random().nextInt(256));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        width: _size,
        height: _size,
        padding: EdgeInsets.all(Random().nextDouble() * 10),
        decoration: BoxDecoration(
          // // TODO: Background image not animating...!
          // image: DecorationImage(
          //   image: AssetImage('assets/elf_${Random().nextInt(3) + 1}.jpg'),
          // ),
          gradient: LinearGradient(colors: [
            Colors.red,
            Colors.blue,
            Colors.green,
            Colors.cyan
          ], stops: [
            Random().nextDouble() * 0.4,
            Random().nextDouble() * 0.6,
            0.7,
            0.9
          ]),
          border: Border.all(
            width: Random().nextDouble() * 10,
            color: _color.withAlpha(255),
          ),
          borderRadius: BorderRadius.circular(Random().nextDouble() * 50),
          // color: _color,
        ),
        child: Center(
          child: Text(
            '!',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
