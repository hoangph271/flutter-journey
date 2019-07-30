import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  final _texts = Map<int, bool>();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([]);
    for (var i = 0; i < 100; i++) {
      _texts.putIfAbsent(i, () => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListView(
        children: _texts.entries
            .map((entry) => ListTile(
                  contentPadding: EdgeInsets.all(0),
                  trailing: Icon(
                    entry.value ? Icons.star : Icons.star_border,
                    color: Colors.red,
                  ),
                  title: Text('Just some dummy text #${entry.key}...!'),
                  onTap: () => this.setState(() {
                    _texts.update(entry.key, (isFavorited) => !isFavorited);
                  }),
                ))
            .toList(),
      ),
    );
  }
}
