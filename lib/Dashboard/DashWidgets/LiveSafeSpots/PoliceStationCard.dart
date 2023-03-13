import 'package:flutter/material.dart';

class PoliceStationCard extends StatelessWidget {
  final Function openMapFunc;
  const PoliceStationCard({Key key, this.openMapFunc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            elevation: 3,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: () {
                openMapFunc("Police Stations near me");
              },
              child: Container(
                  height: 80,
                  width: 80,
                  child: Center(
                      child: Image.asset(
                    "assets/police-badge.png",
                    height: 50,
                  ))),
            ),
          ),
          Container(width: 100, child: Center(child: Text("Police Stations", style: TextStyle(fontSize: 12),)))
        ],
      ),
    );
  }
}
