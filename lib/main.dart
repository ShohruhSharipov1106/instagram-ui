import 'package:flutter/material.dart';
import 'package:instagram_ui/screens/blog_page.dart';
import 'package:instagram_ui/screens/discover_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Instagram UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  DiscoverPage(),
    );
  }
}