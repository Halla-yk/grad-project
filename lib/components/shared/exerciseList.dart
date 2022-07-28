import 'exerciseItem.dart';
import 'exercise_handler.dart';

Map<String, Exercise> Exercises = {
  "dumbell_curl": Exercise(
      exercise_image: 'assets/img/dumbbell_curl.PNG',
      exercise_name: "dumbell_curl",
      exercise_displayName: "Dumbbell curl",
      reps: 1,
      // sets: 1,
      handler: DumbellCurlHandler()),
  "lateral_raise": Exercise(
      exercise_image: 'assets/img/front_lateral_raise.PNG',
      exercise_name: "lateral_raise",
      exercise_displayName: "Front Lateral Raise",
      reps: 1,
      //  sets: 1,
      handler: FrontLateralRaiseHandler()),
  "shoulder_press": Exercise(
      exercise_image: 'assets/img/shoulder_press.PNG',
      exercise_name: "shoulder_press",
      exercise_displayName: "Shoulder Press",
      reps: 1,
      //  sets: 1,
      handler: ShoulderPressHandler()),
};