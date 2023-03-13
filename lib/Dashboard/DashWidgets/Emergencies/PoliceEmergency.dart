import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shake2safety/theme.dart';

class PoliceEmergency extends StatelessWidget {
  const PoliceEmergency({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, bottom: 5),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: InkWell(
          onTap: () {
            _callNumber("100");
          },
          child: Container(
            height: 180,
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  mainColor,
                  // Color(0xFFFB8580),
                  secondaryColor,
                ],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.white.withOpacity(0.5),
                      radius: 25,
                      child: Center(
                          child: Image.asset(
                        "assets/icons/alert.png",
                        height: 35,
                      ))),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Active Emergency",
                              style: TextStyle(
                                  color: font1Color,
                                  fontWeight: FontWeight.bold,
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04),
                            ),
                            Text(
                              "Call 1-0-0 for emergencies.",
                              style: TextStyle(
                                  color: font1Color,
                                  fontSize: MediaQuery.of(context).size.width *
                                      0.025),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        Container(
                          height: 25,
                          width: 80,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(300)),
                          child: Center(
                            child: Text(
                              "1 -0 -0",
                              style: TextStyle(
                                  color: Colors.red[300],
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _callNumber(number) async {
    await FlutterPhoneDirectCaller.callNumber(number);
  }
}
