import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shake2safety/Dashboard/Dashboard.dart';
import 'package:shake2safety/Dashboard/Splsah/Splash.dart';
import 'package:shake2safety/background_services.dart';
import 'package:workmanager/workmanager.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterBackgroundService.initialize(onStart);
  Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: false,
  );
  
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shake 2 Safety',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        primarySwatch: Colors.blue,
      ),
      home: FutureBuilder(
          future: isAppOpeningForFirstTime(),
          builder: (context, AsyncSnapshot<bool> snap) {
            if (snap.hasData) {
              if (snap.data) {
                return Splash();
              } else {
                return Splash();
              }
            } else {
              return Container(
                color: Colors.white,
              );
            }
          }),
    );
  }

  Future<bool> isAppOpeningForFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool result = prefs.getBool("appOpenedBefore") ?? false;
    if (!result) {
      prefs.setBool("appOpenedBefore", true);
    }
    return result;
  }
}
