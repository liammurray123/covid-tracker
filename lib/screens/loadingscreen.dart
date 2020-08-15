import 'package:covid_tracker/constants.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:covid_tracker/covid_data.dart';

class LoadingScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getGlobalData();
  }

  void getGlobalData() async {
    var covidData = await APIDataClass().getGlobalData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(
        covidData: covidData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitChasingDots(
          color: kBlueColor,
          size: 100.0,
        ),
      ),
    );
  }
}
