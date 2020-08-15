import 'package:flutter/material.dart';

class RoundedTabBar extends StatelessWidget {
  RoundedTabBar({this.label1, this.label2});
  final String label1;
  final String label2;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF4E556A),
        borderRadius: BorderRadius.circular(50),
      ),
      child: TabBar(
          unselectedLabelColor: Colors.white,
          labelColor: Color(0xFF0D1333),
          indicatorSize: TabBarIndicatorSize.tab,
          indicator: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Colors.white,
          ),
          tabs: [
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(label1),
              ),
            ),
            Tab(
              child: Align(
                alignment: Alignment.center,
                child: Text(label2),
              ),
            ),
          ]),
    );
  }
}
