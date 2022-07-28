import 'package:flutter/material.dart';
import '../../pages/manage_workout.dart';

class setup_button extends StatefulWidget {
  setup_button({Key? key}) : super(key: key);

  @override
  State<setup_button> createState() => _setup_buttonState();
}

class _setup_buttonState extends State<setup_button> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        child: InkWell(
          onTap: () => Navigator.push(
            context,
            PageRouteBuilder(
                pageBuilder: (context, animation1, animation2) =>
                    ManageWorkout(),
                transitionDuration: Duration(seconds: 0),
                reverseTransitionDuration: Duration.zero),
          ),
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
                        "MANAGE WORKOUTS",
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),

                  ),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0)),
                ),
              ),

            ),
          ),
        ));
  }
}
