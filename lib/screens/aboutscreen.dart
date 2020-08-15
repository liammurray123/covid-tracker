import 'package:covid_tracker/widgets/roundedtabbar.dart';
import 'package:flutter/material.dart';
import 'package:covid_tracker/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:covid_tracker/widgets/pillbutton.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
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
                flex: 2,
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
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
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'About',
                        style: kPageTitleStyle,
                      ),
                      Text(
                          'Covid Tracker is an Open Source, free to use project. It would be much appreciated if you would help support the project, so we can keep it running and up to date. You can find more info on the webpage.',
                          style: kPageSubtitleCaptionStyle),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          PillButton(
                            icon: FontAwesomeIcons.link,
                            label: 'Webpage',
                            color: kRedColor,
                            onPressed: () {
                              launch(
                                  'https://liam-murray.glitch.me/covidtracker');
                            },
                          ),
                          PillButton(
                            icon: FontAwesomeIcons.fileContract,
                            label: 'Legal Stuff',
                            color: kRedColor,
                            onPressed: () {
                              showAboutDialog(
                                context: context,
                                applicationIcon:
                                    Image.asset('assets/images/covidlogo.png'),
                                applicationName: 'Covid Tracker',
                                applicationVersion: '1.0.0',
                                applicationLegalese:
                                    'Covid Tracker is licensed under the GNU GPLv3 license, allowing you to remake and distribute open-source versions.',
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Meet The Team',
                        style: kPageSubtitleStyle,
                      ),
                      RoundedTabBar(
                        label1: 'Liam Murray',
                        label2: 'simantOo',
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: TabBarView(
                    children: [
                      UserData(
                        assetimage: 'assets/images/liammurray.jpg',
                        name: 'Liam Murray',
                        job: 'Web and mobile, full stack dev',
                        bodytext:
                            'Liam is an High School Student, and open source contributer. You can find his work on his webpage, liam-murray.glitch.me',
                      ),
                      UserData(
                        assetimage: 'assets/images/simantOo.png',
                        name: 'simantOo',
                        job:
                            'Mobile Design, UI / Visual Design, UX Design / Research',
                        bodytext: 'DATA HERE',
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

class UserData extends StatelessWidget {
  UserData({this.name, this.job, this.bodytext, this.assetimage});
  String name;
  String job;
  String bodytext;
  String assetimage;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            assetimage,
            scale: 8,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: kHealthPanelTitleStyle,
              ),
              Text(
                job,
                style: kHealthPanelBodyStyle,
              ),
            ],
          ),
          Text(
            bodytext,
            style: kHealthPanelBodyStyle,
          ),
        ],
      ),
    );
  }
}
