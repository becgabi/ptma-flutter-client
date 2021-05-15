import 'dart:convert' show json, base64, ascii;

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ptma_flutter_client/di/di_config.dart';
import 'package:ptma_flutter_client/ui/appointmentlist/appointment_list.dart';
import 'package:ptma_flutter_client/ui/login/login.dart';
import 'package:ptma_flutter_client/ui/util.dart';
import 'package:ptma_flutter_client/ui/workoutdetail/workout_detail.dart';
import 'package:ptma_flutter_client/ui/workoutlist/workout_list.dart';

void main() {
  initDependencies();
  runApp(PtmaApp());
}

class PtmaApp extends StatelessWidget {
  Future<bool> get _isUserLoggedIn async {
    final storage = FlutterSecureStorage();
    var token = await storage.read(key: "jwtToken") ?? "";
    var jwt = token.split(".");
    if (jwt.length == 3) {
      var payload =
          json.decode(ascii.decode(base64.decode(base64.normalize(jwt[1]))));
      if (DateTime.fromMillisecondsSinceEpoch(payload["exp"] * 1000)
          .isAfter(DateTime.now())) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: injector.allReady(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return MaterialApp(
            title: 'PTMA Application',
            theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Color(0xFFECF5FB),
              textTheme: TextTheme(
                subtitle1: TextStyle(),
                bodyText1: TextStyle(),
                bodyText2: TextStyle(),
              ).apply(
                bodyColor: Colors.black54,
                displayColor: Colors.black54,
              ),
            ),
            home: FutureBuilder<bool>(
                future: _isUserLoggedIn,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return context.centerProgressBar;
                  }
                  var loggedIn = snapshot.data!;
                  if (loggedIn) {
                    return AppointmentListPage();
                  } else {
                    return LoginPage();
                  }
                }),
            routes: {
              LoginPage.routeName: (context) => LoginPage(),
              AppointmentListPage.routeName: (context) => AppointmentListPage(),
              WorkoutListPage.routeName: (context) => WorkoutListPage(),
              WorkoutDetailPage.routeName: (context) => WorkoutDetailPage(),
            },
          );
        }

        return context.centerProgressBar;
      },
    );
  }
}
