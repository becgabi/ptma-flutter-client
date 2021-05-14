import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:ptma_flutter_client/ui/appointmentlist/appointment_list.dart';
import 'package:ptma_flutter_client/ui/login/login.dart';
import 'package:ptma_flutter_client/ui/util.dart';
import 'package:ptma_flutter_client/ui/workoutlist/workout_list.dart';

class PtmaDrawer extends StatelessWidget {
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      width: MediaQuery.of(context).size.width * 0.75,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Center(
              child: Image(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.fill,
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          Divider(
            color: Colors.white,
            height: 1,
          ),
          ListTile(
            title: context.whiteText('Appointments'),
            onTap: () => context.popAndPush(APPOINTMENT_LIST_PAGE),
          ),
          ListTile(
            title: context.whiteText('Workouts'),
            onTap: () => context.popAndPush(WORKOUT_LIST_PAGE),
          ),
          ListTile(
            title: context.whiteText('Logout'),
            onTap: () {
              _deleteToken().then((value) => context.popAndPush(LOGIN_PAGE));
            },
          ),
        ],
      ),
    );
  }

  Future<void> _deleteToken() async {
    await storage.delete(key: "jwtToken");
  }
}
