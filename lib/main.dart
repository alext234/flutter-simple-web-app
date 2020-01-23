import 'package:flutter/material.dart';
import 'dart:typed_data';

void main() => runApp(SimpleApp());

class SimpleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'A file upload app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Home page of file upload app'),
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
        body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
              MaterialButton(
                color: Colors.lightBlue,
                elevation: 8,
                highlightElevation: 2,
                shape: RoundedRectangleBorder(),
                textColor: Colors.white,
                child: Text('Choose file'),
                onPressed: () {
                  // TODO handle file select button
                },
              ),
              RaisedButton(
                color: Colors.blueGrey,
                elevation: 8.0,
                textColor: Colors.white,
                onPressed: () {
                  // TODO handle server upload
                },
                child: Text('Upload'),
              ),
            ])));
  }
}
