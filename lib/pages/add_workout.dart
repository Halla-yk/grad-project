import 'package:flutter/material.dart';
import 'package:project/components/shared/exerciseItem.dart';
import 'set_repetitions.dart';
import '../components/shared/exerciseItem.dart';
import '../components/shared/exerciseList.dart';

class AddWorkout extends StatefulWidget {
  AddWorkout({Key? key}) : super(key: key);

  @override
  State<AddWorkout> createState() => _AddWorkoutState();
}

class _AddWorkoutState extends State<AddWorkout> {
  late double card_height;
  late double card_width;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;

  List<Exercise> includedExercises = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      card_height = 200;
      card_width = 150;
    });
    print("\n hey\n" + card_height.toString());
  }

  void onSelect(Exercise? exercise) {
    setState(() {
      if (includedExercises.contains(exercise)) {
        includedExercises.remove(exercise!);
        return;
      }
      includedExercises.add(exercise!);
    });
  }

  Widget workoutCard(exercisesName,exercisesImage,text){
    return  Container(
      height: 180,
      width: 150,
      child: InkWell(
        onTap: () {

          onSelect(Exercises[exercisesName]);
        },
        child: Column(
          children: [
            SizedBox(height: 10,),
            Center(
              child: Image.asset(
                exercisesImage,
                height: 120,
                width: 110,
              ),
            ),
            Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  text,
                  style:
                  const TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
      decoration: includedExercises
          .contains(Exercises[exercisesName])
          ? BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border:
        Border.all(width: 2, color: Colors.orange),
      )
          : BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
            width: 2, color: const Color(0xFFC7EDF1)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            const Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Text('Manage workouts')),
            const SizedBox(width: 35, height: 35)
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            const Positioned(
                top: 30,
                left: 40,
                child: Text(
                  'Select exercises to include\n        in your workout',
                  style: TextStyle( fontSize: 25),
                )),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    workoutCard('dumbell_curl','assets/img/dumbbell_curl.PNG','Dumbbell Curl'),
                    const SizedBox(
                      width: 30,
                    ),
                    workoutCard('lateral_raise','assets/img/front_lateral_raise.PNG','Front Lateral Raise'),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    workoutCard('shoulder_press','assets/img/shoulder_press.PNG','Shoulder Press'),
                  ],
                )
              ],
            ),
            Positioned(
                bottom: 20,
                right: 10,
                child: FloatingActionButton(
                    onPressed: includedExercises.length != 0
                        ? () => Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (context, animation1,
                              animation2) =>
                              SetRepetitions(
                                  selected_cards: includedExercises),
                          transitionDuration: Duration(seconds: 0),
                          reverseTransitionDuration: Duration.zero),
                    )
                        : null,
                    backgroundColor: Colors.black,
                    child: Center(
                        child: Image.asset(
                          'assets/img/add_icon.png',
                          height: 20,
                          width: 20,
                        ))))
          ],
        ),
      ),
    );
  }
}
