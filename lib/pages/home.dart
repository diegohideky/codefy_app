
import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String link;
  final TextEditingController linkController = TextEditingController();

  final clipboardContentStream = StreamController<String>.broadcast();

  Timer clipboardTriggerTime;

  @override
  void initState() {
    super.initState();
    clipboardTriggerTime = Timer.periodic(
    const Duration(seconds: 5),
      (timer) {
        Clipboard.getData('text/plain').then((clipboarContent) {
          clipboardContentStream.add(clipboarContent.text);

          if (clipboarContent.text.contains('http') && clipboarContent.text != linkController.text) {
            linkController.text = clipboarContent.text;
          }
        });
      },
    );
  }

  @override
  void dispose() {
    clipboardContentStream.close();

    clipboardTriggerTime.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                controller: linkController,
                decoration: InputDecoration(
                  labelText: 'Cole sua url aqui',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black87)
                ),
                onPressed: () {
                  linkController.text = this.link;
                },
                color: Colors.black87,
                textColor: Colors.white,
                child: Text(
                  'codificar'.toUpperCase(),
                  style: TextStyle(fontSize: 14)
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
