import 'package:flutter/material.dart';

class PharmacyCard extends StatelessWidget {
    final Function openMapFunc;

  const PharmacyCard({Key key, this.openMapFunc}) : super(key: key);

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
              onTap: (){
                openMapFunc("Pharmacies near me");
              },
              child: Container(
                  height: 80,
                  width: 80,
                  child: Center(
                      child: Image.asset(
                    "assets/pharmacy.png",
                    height: 50,
                  ))),
            ),
          ),
          Container(width: 100, child: Center(child: Text("Pharmacies", style: TextStyle(fontSize: 12),)))
        ],
      ),
    );
  }
}
