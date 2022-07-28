import 'package:flutter/material.dart';
import 'package:project/pages/add_workout.dart';

import '../components/shared/exerciseItem.dart';
import '../components/shared/exerciseList.dart';

import 'order_workout.dart';

class SetRepetitions extends StatefulWidget {
  List<Exercise> selected_cards;
  SetRepetitions({Key? key, required this.selected_cards}) : super(key: key);

  @override
  State<SetRepetitions> createState() => _SetRepetitionsState(selected_cards);
}

class _SetRepetitionsState extends State<SetRepetitions> {
  List<Exercise> selected_cards;

  void onSliderChange(int RepsOrSets, Exercise exercise) {
    final indexOfExercise = selected_cards.indexOf(exercise);
    setState(() {
      if(RepsOrSets == 0){
        selected_cards[indexOfExercise].reps++;
      }

          //: selected_cards[indexOfExercise].sets = value.round();
    });
  }

  _SetRepetitionsState(this.selected_cards);

  @override
  void initState() {
    super.initState();
    // Resetting rep and set counters
    for (Exercise exercise in selected_cards) {
      exercise.reps = 1;
   //   exercise.sets = 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Text('Manage workouts')),
            Image.asset('assets/img/shoulder_press_icon.png',
                width: 35, height: 35)
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: Container(
        height: 1000,
        child: Stack(children: [
          ClipRect(
            child: ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(" Set exercise sets and repetitions",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontFamily: 'Roboto', fontSize: 25)),
                  Container(
                    child: ClipRect(
                        child: Column(
                      children: [
                        for (Exercise exercise in selected_cards)
                          Container(
                              child: Row(
                            children: [

                              Container(
                                height: 150,
                                width: 120,
                                margin: EdgeInsets.only(left: 20,bottom: 20,top: 20),
                                child: Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Center(
                                      child: Image.asset(
                                        exercise.exercise_image,
                                        height: 100,
                                        width: 100,
                                      ),
                                    ),
                                    Container(
                                        margin: EdgeInsets.all(10),
                                        child: Text(
                                          exercise.exercise_displayName,
                                          style:
                                          const TextStyle(fontWeight: FontWeight.bold,fontSize: 10),
                                        ))
                                  ],
                                ),

                                decoration:  BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                      width: 2, color: const Color(0xFFC7EDF1)),
                                ),
                              ),
                              Column(
                                  children: [

                                    Row(
                                      children: [

                                        MaterialButton(

                                          onPressed: () {
                                            final indexOfExercise = selected_cards.indexOf(exercise);
                                            setState(() {
                                                if(selected_cards[indexOfExercise].reps != 0){
                                                  selected_cards[indexOfExercise].reps--;
                                                }
                                            });
                                          },

                                          color: Colors.orange,
                                          textColor: Colors.white,
                                          child: Icon(
                                            Icons.remove,
                                            size: 24,
                                          ),
                                          padding: EdgeInsets.all(16),
                                          shape: CircleBorder(),
                                        ),
                                        Column(children: [
                                          Text('Reps'),
                                          Text(exercise.reps.toInt().toString(),
                                              style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontSize: 30)),
                                        ]),
                                        MaterialButton(
                                          onPressed: () {
                                            onSliderChange(0,  exercise);
                                          },
                                          color: Colors.orange,
                                          textColor: Colors.white,
                                          child: Icon(
                                            Icons.add,
                                            size: 24,
                                          ),
                                          padding: EdgeInsets.all(16),
                                          shape: CircleBorder(),
                                        )
                                      ],
                                    ),

                                  ],
                                ),

                            ],
                          ))
                      ],
                    )),
                  ),
                ]),
          ),

        ]),
      ),
      bottomNavigationBar:  MaterialButton(
        height: 60,
        minWidth: 100,
        onPressed: () => Navigator.push(
          context,
          PageRouteBuilder(
              pageBuilder: (context, animation1, animation2) =>
                  OrderWorkout(selected_cards: selected_cards),
              transitionDuration: Duration(seconds: 0),
              reverseTransitionDuration: Duration.zero),
        ).then((value) {
          setState(() {});
        }),
        color: Colors.black,
        textColor: Colors.white,
        child: const Text('Next',style: TextStyle(fontSize: 25)))
    );
  }
}
