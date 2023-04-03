import 'package:flutter/material.dart';
import 'package:galaxy_planets/screens/homepage.dart';
import 'package:galaxy_planets/screens/secondpage.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      routes: {
        '/' : (context) => const homepage(),
        'secondpage' :(context) => const secondpage(),
      },
    ),
  );
}

