import 'package:flutter/material.dart';

import 'ui/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ibhavikmakwana',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.white,
        fontFamily: 'MajorMonoDisplay',
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}
