import 'package:flutter/material.dart';
import 'package:numbered_rating/numbered_rating.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'numbered rating example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.dark,
      ),
      home: MyHomePage(title: 'numbered rating example'),
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
      body: Column(
        children: <Widget>[
          Center(
            child: NumberedRating(
                // selectedBorderColor: Colors.blueAccent,
                // selectedColor: Colors.grey,
                ),
          ),
          Center(
            child: NumberedRating(
              minRating: 5,
              maxRating: 6,
              // selectedBorderColor: Colors.blueAccent,
              // selectedColor: Colors.grey,
            ),
          ),
          Center(
            child: NumberedRating(
              maxRating: 10,
              // selectedBorderColor: Colors.blueAccent,
              // selectedColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
