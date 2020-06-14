import 'package:flutter/material.dart';
import "package:heated/ui/home/home_page.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:random_names/random_names.dart';

class HeatedApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   // final randomNames = generateRandomNames(1);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.limeAccent,
        primarySwatch: Colors.blue,
        accentColor: Colors.purpleAccent,
        dividerColor: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RandomWords(),
      // MyHomePage(title: 'Heated Home'),
    );
    
  }
} 