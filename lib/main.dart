import 'package:flutter/material.dart';
import 'package:news_api_org/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NEWZ',
      theme: ThemeData(
        primaryColor: Colors.lightBlue,
      ),
      home: const Home(),
    );
  }
}
