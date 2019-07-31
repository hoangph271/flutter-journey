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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey,
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                  padding: EdgeInsets.all(8),
                  color: Colors.green,
                  child: Center(child: Text('First row...!'))),
              Expanded(
                  child: Container(
                      color: Colors.pink,
                      child: Center(child: Text('Second row...!')))),
              Expanded(
                  flex: 2,
                  child: Container(
                      color: Colors.green,
                      child: Center(child: Text('Third row...!')))),
              Expanded(
                  flex: 3,
                  child: Container(
                      color: Colors.pink,
                      child: Center(child: Text('Fourth row...!')))),
            ],
          ),
        ),
      ),
    );
  }
}
