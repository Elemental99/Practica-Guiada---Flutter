import 'package:emailapp/screen/detailScreen.dart';
import 'package:emailapp/screen/listScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Email App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: 'ListScreen',
      routes: {
        'ListScreen': (context) => const ListScreen(),
        'DetailScreen': (context) => const DetailScreen(),
      },
    );
  }
}
