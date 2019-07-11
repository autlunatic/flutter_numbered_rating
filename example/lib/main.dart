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
          Text("default"),
          Center(
            child: NumberedRating(
                // selectedBorderColor: Colors.blueAccent,
                // selectedColor: Colors.grey,
                ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          Text("only 5 and 6 dynamic size SelectMode.check"),
          Center(
            child: NumberedRating(
              minRating: 5,
              maxRating: 6,
              color: Colors.blueAccent,
              selectedBorderColor: Colors.black,
              selectedColor: Colors.yellowAccent,
              fixedItemWidth: 80.0,
              selectMode: SelectMode.check,
              // selectedBorderColor: Colors.blueAccent,
              // selectedColor: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          Text("10 ratings custom colors"),
          Center(
            child: NumberedRating(
              maxRating: 10,
              color: Colors.grey,
              borderColor: Colors.yellow,
              selectedBorderColor: Colors.red,
              selectedColor: Colors.orangeAccent,
              // selectedBorderColor: Colors.blueAccent,
              // selectedColor: Colors.grey,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Divider(),
          ),
          Text("8 to 10 fixed Size"),
          Center(
            child: NumberedRating(
              minRating: 8,
              maxRating: 10,
              fixedItemWidth: 70,
              onSelectRating: print,
              // selectedBorderColor: Colors.blueAccent,
              // selectedColor: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
