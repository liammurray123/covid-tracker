import 'package:covid_tracker/constants.dart';
import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  DataCard({this.color, this.label, this.value});
  final color;
  final String label;
  final int value;

  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        height: 100,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: kDataCardLabelStyle,
            ),
            Text(
              value.toString(),
              style: kDataCardValueStyle,
            ),
          ],
        ),
      ),
    );
  }
}
