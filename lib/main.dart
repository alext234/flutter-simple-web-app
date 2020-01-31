import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'dart:convert';
import 'dart:html' as html;

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
  String _contentType = "n/a";
  String _filename = "";
  int _contentLength = 0;


  handleFileSelect() async {
    html.InputElement uploadInput = html.FileUploadInputElement()..multiple=false..draggable=true;    
    uploadInput.click();
    
    // onChange does not work on mobile safari hence using this fix
    // https://stackoverflow.com/questions/57264032/uploading-images-on-flutter-web-using-a-pub-other-than-the-image-picker
    uploadInput.addEventListener('change', (e) async {
      final files = uploadInput.files;
      final file = files[0];
      final reader = new html.FileReader();
      this.setState((){
        _filename = file.name;
        _contentLength = file.size;
      });


      reader.onError.listen((error){}); // TODO
       reader.onLoadEnd.listen((e) {
        _handleFileSelectResult(reader.result);
      });
      reader.readAsDataUrl(file);

    });

    //* need to append on mobile safari
    html.document.body.append(uploadInput);

  }

  void _handleFileSelectResult(Object result) {
    setState(() {
      final resultArr = result.toString().split(",");
      final contentType = resultArr.first; // e.g. data:image/png;base64
      final base64Content = resultArr.last; // base64 string
      final bytesContent = Base64Decoder().convert(base64Content);

      this.setState((){
        _contentType = contentType;
      });

    });
  }

  Widget fileCard() {
    Card card = Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new ListTile(
                        title: new Text("File : $_filename"),
                        subtitle:
                        new Text("File type: $_contentType; Size : $_contentLength"),
                      ),
                      ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: new Text("Upload"),
                            onPressed: () { }, // TODO handle the upload button
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              
    return  Visibility(
      child: card,
      visible: _contentLength>0,
    );
  }

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
                  handleFileSelect();
                },
              ),
              SizedBox(
                width: 400.0,
                height: 150.0,
                child: fileCard(),
              ),              
            ])));
  }
}
