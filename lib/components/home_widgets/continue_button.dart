import 'package:flutter/material.dart';
import '../../workout_tracker.dart';
import '../shared/local_storage.dart';

class continue_button extends StatefulWidget {
  continue_button({Key? key}) : super(key: key);

  @override
  State<continue_button> createState() => _continue_buttonState();
}

class _continue_buttonState extends State<continue_button> {
  late LocalStorage jsonHandler;

  @override
  void initState() {
    super.initState();
    initAsync();
  }

  void initAsync() async {
    jsonHandler = LocalStorage();
    await jsonHandler.init();
    setState(() {
      jsonHandler.weekFileExists ? jsonHandler.fetchWeekSchedule() : null;
      jsonHandler.fetchDayToday();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageRouteBuilder(
                  pageBuilder: (context, animation1, animation2) => WorkoutTracker(),
                  transitionDuration: Duration(seconds: 0),
                  reverseTransitionDuration: Duration.zero),
            );
          } ,
          child: Center(
            child: Container(
              child:
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Container(
                  child: Container(
                    height: 70,
                    width: 300,
                    child: const Center(
                      child: Text(
                        "START WORKOUTS",
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                  ),
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),

            ),
          ),
        ));
  }
}
