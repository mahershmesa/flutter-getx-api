import 'package:flutter/material.dart';
import 'package:flutter_getx_api/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'shop app',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: HomeView(),
    );
  }
}
