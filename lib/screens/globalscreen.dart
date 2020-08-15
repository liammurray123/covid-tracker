import 'package:covid_tracker/covid_data.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/widgets/datacard.dart';

class GlobalScreen extends StatefulWidget {
  GlobalScreen({this.covidData});
  final covidData;
  @override
  _GlobalScreenState createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  APIDataClass apiClass = APIDataClass();
  int globalnewcases;
  int globalnewdeaths;
  int globalnewrecovered;
  int globaltotalcases;
  int globaltotaldeaths;
  int globaltotalrecovered;
  String selectedCountry = 'Australia';
  String updatedtime;
  int countryHealthNumber;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    var covidData = await APIDataClass().getGlobalData();
    updateUI(covidData);
  }

  void updateUI(dynamic covidData) {
    setState(() {
      if (covidData == null) {
        globaltotalcases = 0;
        globaltotaldeaths = 0;
        globaltotalrecovered = 0;
        globalnewcases = 0;
        globalnewdeaths = 0;
        globalnewrecovered = 0;
        return;
      }
      globaltotalcases = covidData['Global']['TotalConfirmed'];
      globaltotaldeaths = covidData['Global']['TotalDeaths'];
      globaltotalrecovered = covidData['Global']['TotalRecovered'];
      globalnewcases = covidData['Global']['NewConfirmed'];
      globalnewdeaths = covidData['Global']['NewDeaths'];
      globalnewrecovered = covidData['Global']['NewRecovered'];
      updatedtime = covidData['Date'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 3,
          child: Container(
            child: Column(
              children: [
                Row(
                  children: [
                    DataCard(
                      value: globaltotalcases,
                      label: 'Total Cases',
                      color: Color(0xFF4D79FF),
                    ),
                    DataCard(
                      value: globaltotaldeaths,
                      label: 'Total Deaths',
                      color: Color(0xFF9059FF),
                    ),
                  ],
                ),
                Row(
                  children: [
                    DataCard(
                      value: globaltotalrecovered,
                      label: 'Recovered',
                      color: Color(0xFF4CD97B),
                    ),
                    DataCard(
                      value: globalnewcases,
                      label: 'New Cases',
                      color: Color(0xFFFFB259),
                    ),
                    DataCard(
                      value: globalnewdeaths,
                      label: 'New Deaths',
                      color: Color(0xFFFF4D58),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
