import 'package:covid_tracker/constants.dart';
import 'package:flutter/material.dart';

class PreventionCard extends StatelessWidget {
  PreventionCard({this.image, this.label});
  final String image;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.asset(image),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 5),
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: kBlueColor,
              fontSize: 15,
              height: 1.2,
            ),
          ),
        ],
      ),
    );
  }
}
