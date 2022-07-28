// import 'dart:convert';
// import 'dart:io';
// import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';

import '../components/shared/local_storage.dart';

class SetupRoutine extends StatefulWidget {
  SetupRoutine({Key? key}) : super(key: key);

  @override
  State<SetupRoutine> createState() => _SetupRoutineState();
}

class _SetupRoutineState extends State<SetupRoutine> {
  late LocalStorage jsonHandler;

  // UNCOMMENT

  // late File workoutJsonFile;
  // late File weekJsonFile;

  // late Directory dir;

  // String workoutsFileName = "Workouts.json";
  // String weekFileName = "WeekSchedule.json";
  // bool workoutfileExists = false;
  // bool weekFileExists = false;

  // List<dynamic> workouts = [];
  // Map<String, dynamic> weekSchedule = {};

  String selectedWorkout = "Workout 1";

  @override
  void initState() {
    super.initState();


    initAsync();
  }

  initAsync() async {
    jsonHandler = LocalStorage();
    await jsonHandler.init();
    jsonHandler.fetchWorkouts();
    setState(() {
      jsonHandler.weekFileExists
          ? jsonHandler.fetchWeekSchedule()
          : jsonHandler.createWeekFile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: jsonHandler.workouts.length > 0
          ? Container(
              child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text("Routine",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 25)),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 4),
                    alignment: Alignment.centerLeft,
                    child: Text("Select workout:")),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  width: 300,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.black, width: 4)),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<dynamic>(
                        value: selectedWorkout,
                        items: jsonHandler.workouts.map(buildMenuItem).toList(),
                        onChanged: (workout) => setState(() {
                              selectedWorkout = workout;
                            })),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 4),
                    alignment: Alignment.centerLeft,
                    child: Text("Select days:")),
                SizedBox(
                  height: 30,
                ),
                buildWeekRow()
              ],
            ))
          : Center(
              child: Text(
                "No workouts available, please create one first",
                textAlign: TextAlign.center,
              ),
            ),
    );
  }

  DropdownMenuItem buildMenuItem(workout) => DropdownMenuItem(
      value: workout["workout_no"], child: Text(workout["workout_no"]));

  Wrap buildWeekRow() => Wrap(
    spacing: 10,
    runSpacing: 15,
        children: [
          SizedBox(width: 2),
          for (String day in [
            "Sun",
            "Mon",
            "Tues",
            "Wed",
            "Thurs",
            "Fri",
            "Sat"
          ])
            GestureDetector(
              onTap: jsonHandler.weekSchedule[day] == selectedWorkout
                  ? () => setState(() {
                jsonHandler.writeToWeekFile("", day);
              })
                  : () => setState(() {
                jsonHandler.writeToWeekFile(selectedWorkout, day);
              }),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                decoration: BoxDecoration(
                  color: jsonHandler.weekSchedule[day] == selectedWorkout
                      ? const Color(0xFFC7EDF1)
                      : jsonHandler.weekSchedule[day] == ""
                      ? Colors.grey
                      : Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  day,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: true ? Colors.white : Colors.grey,
                  ),
                ),
              ),
            )


        ],
      );
}


