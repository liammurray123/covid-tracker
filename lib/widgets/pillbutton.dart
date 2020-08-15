import 'package:flutter/material.dart';
import 'package:covid_tracker/constants.dart';

class PillButton extends StatelessWidget {
  PillButton({this.color, this.label, this.icon, this.onPressed});
  final Color color;
  final String label;
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10,
            ),
          ),
          Text(
            label,
            style: kPillButtonLabelStyle,
          ),
        ],
      ),
      onPressed: onPressed,
      fillColor: color,
    );
  }
}
