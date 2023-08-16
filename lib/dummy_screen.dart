import 'package:flutter/material.dart';
import 'package:oes/screens/addElectionScreen/addElection.dart';
import './screens/loginScreen/login_screen.dart';
import './screens/nidAddScreen/nidaddScreen.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';

class Dummy extends StatefulWidget {
  static String routeName = '/dummy';

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  @override
  Widget build(BuildContext context) {
    int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {
            endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 30;
          });
        },
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(LoginScreen.routeName);
                  },
                  child: Text('Login')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(NidAddScreen.routeName);
                  },
                  child: Text('Nid Registration')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AddElection.routeName);
                  },
                  child: Text('Add Election')),
              Text('This is dummy Screen'),
              Text('This is dummy Screen'),
              SizedBox(
                height: 50,
              ),
              Center(
                child: CountdownTimer(
                  endTime: endTime,
                  widgetBuilder: (_, time) {
                    if (time == null) {
                      return Text('Game over');
                    }
                    return Text(
                        'days: [ ${time.days} ], hours: [ ${time.hours} ], min: [ ${time.min} ], sec: [ ${time.sec} ]');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
