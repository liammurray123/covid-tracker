import 'package:covid_tracker/constants.dart';
import 'package:covid_tracker/covid_data.dart';
import 'package:covid_tracker/widgets/pillbutton.dart';
import 'package:flutter/material.dart';
import 'countryscreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covid_tracker/widgets/preventioncard.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.covidData});
  final covidData;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
  }

  // Makes the pickers with the country codes from coin_data.dart
  DropdownButton<String> androidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];
    for (String country in countryList) {
      var newItem = DropdownMenuItem(
          child: Text(
            country,
          ),
          value: country);
      dropdownItems.add(newItem);
    }
    return DropdownButton<String>(
      value: selectedCountry,
      icon: Icon(
        Icons.arrow_drop_down,
        size: 30,
      ),
      style: kDropdownButtonStyle,
      dropdownColor: Colors.white,
      iconEnabledColor: kDarkBlueColor,
      items: dropdownItems,
      onChanged: (value) {
        setState(() async {
          selectedCountry = value;
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CountryScreen(
                  inputcountry: value,
                ),
              ));
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.only(left: 20),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: kBlueColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                      padding: EdgeInsets.all(10),
                      onPressed: () {
                        Navigator.pushNamed(context, '/about');
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Covid-19',
                          style: kPageTitleStyle,
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 20),
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: androidDropdown(),
                        ),
                      ],
                    ),
                    Text('Are you feeling sick?', style: kPageSubtitleStyle),
                    Text(
                        'If you feel sick with any Covid-19 symptoms, \nplease call or SMS you local hospital immediately.',
                        style: kPageSubtitleCaptionStyle),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PillButton(
                          icon: FontAwesomeIcons.phoneAlt,
                          label: 'Call EMS',
                          color: kRedColor,
                          onPressed: () {
                            launch('tel://112');
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Prevention',
                      style: TextStyle(
                        color: kBlueColor,
                        fontSize: 20,
                        fontFamily: 'Graphik',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        PreventionCard(
                          image: 'assets/images/socialdistancing.png',
                          label: 'Maintain\nSocial Distancing',
                        ),
                        PreventionCard(
                          image: 'assets/images/washhands.png',
                          label: 'Clean your \nhands often',
                        ),
                        PreventionCard(
                          image: 'assets/images/wearamask.png',
                          label: 'Wear a \nfacemask',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}
