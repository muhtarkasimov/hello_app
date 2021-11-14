import 'package:flutter/material.dart';

class LanguagePage extends StatefulWidget {
  LanguagePage({required Key key}) : super(key: key);

  @override
  LanguagePageState createState() => LanguagePageState();
}

class LanguagePageState extends State<LanguagePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Языки"),
      ),
    );
  }

}