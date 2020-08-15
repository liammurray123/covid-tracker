import 'package:covid_tracker/screens/globalscreen.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/covid_data.dart';
import 'package:covid_tracker/constants.dart';
import 'package:covid_tracker/widgets/datacard.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covid_tracker/widgets/pillbutton.dart';
import 'package:covid_tracker/widgets/roundedtabbar.dart';

class CountryScreen extends StatefulWidget {
  CountryScreen({Key key, @required this.inputcountry}) : super(key: key);
  final String inputcountry;

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  APIDataClass apiClass = APIDataClass();
  String selectedCountry;
  int newcases;
  int newdeaths;
  int newrecovered;
  int totalcases;
  int totaldeaths;
  int totalrecovered;
  String updatedtime;
  int countryNumber;
  int countryHealthNumber;

  @override
  void initState() {
    super.initState();
    selectedCountry = widget.inputcountry;

    getCountryNumber();
    getCountryHealthNumber();
    updateUI();
  }

  Future<int> getCountryNumber() async {
    countryNumber = await APIDataClass().getCountryNumber(widget.inputcountry);
    return countryNumber;
  }

  Future<int> getCountryHealthNumber() async {
    countryHealthNumber =
        await APIDataClass().getCountryHealthNumber(widget.inputcountry);
    return countryHealthNumber;
  }

  void updateUI() async {
    var countrycovidData = await APIDataClass().getGlobalData();
    setState(() {
      if (countrycovidData == null) {
        totalcases = 0;
        totaldeaths = 0;
        totalrecovered = 0;
        newcases = 0;
        newdeaths = 0;
        newrecovered = 0;
        return;
      }
      totalcases =
          countrycovidData['Countries'][countryNumber]['TotalConfirmed'];
      totaldeaths = countrycovidData['Countries'][countryNumber]['TotalDeaths'];
      totalrecovered =
          countrycovidData['Countries'][countryNumber]['TotalRecovered'];
      newcases = countrycovidData['Countries'][countryNumber]['NewConfirmed'];
      newdeaths = countrycovidData['Countries'][countryNumber]['NewDeaths'];
      newrecovered =
          countrycovidData['Countries'][countryNumber]['NewRecovered'];
      updatedtime = countrycovidData['Date'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kBlueColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        color: Colors.white,
                        padding: EdgeInsets.all(10),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        selectedCountry,
                        style: kPageTitleStyle,
                      ),
                      RoundedTabBar(
                        label1: selectedCountry,
                        label2: 'Global',
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                // STATS CARDS SECTION
                flex: 1,
                child: Container(
                  child: TabBarView(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              DataCard(
                                value: totalcases,
                                label: 'Total Cases',
                                color: Color(0xFF4D79FF),
                              ),
                              DataCard(
                                value: totaldeaths,
                                label: 'Total Deaths',
                                color: Color(0xFF9059FF),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              DataCard(
                                value: totalrecovered,
                                label: 'Recovered',
                                color: Color(0xFF4CD97B),
                              ),
                              DataCard(
                                value: newcases,
                                label: 'New Cases',
                                color: Color(0xFFFFB259),
                              ),
                              DataCard(
                                value: newdeaths,
                                label: 'New Deaths',
                                color: Color(0xFFFF4D58),
                              ),
                            ],
                          ),
                        ],
                      ),
                      GlobalScreen(),
                    ],
                  ),
                ),
              ),
              // HEALTH CARD SECTION
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Need help?',
                        style: kHealthPanelTitleStyle,
                      ),
                      Text(
                        'In $selectedCountry, the non-emergency line number is $countryHealthNumber, click below to call it.',
                        style: kHealthPanelBodyStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PillButton(
                            icon: FontAwesomeIcons.phoneAlt,
                            label: 'Call EMS',
                            color: kRedColor,
                            onPressed: () {
                              launch('tel://$countryHealthNumber');
                            },
                          ),
                          PillButton(
                            icon: FontAwesomeIcons.redo,
                            label: 'Refresh',
                            color: kMedBlueColor,
                            onPressed: () async {
                              updateUI();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
