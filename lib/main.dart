import 'package:covid_tracker/constants.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/screens/loadingscreen.dart';
import 'package:covid_tracker/screens/homescreen.dart';
import 'package:covid_tracker/screens/countryscreen.dart';
import 'package:covid_tracker/screens/aboutscreen.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light().copyWith(
        primaryColor: kBlueColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/about': (context) => AboutScreen(),
        '/country': (context) => CountryScreen(inputcountry: null),
        '/home': (context) => HomeScreen(),
        '/': (context) => LoadingScreen(),
      },
    );
  }
}
