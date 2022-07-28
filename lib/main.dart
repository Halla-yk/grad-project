import 'package:flutter/material.dart';
import 'package:project/pages/home.dart';
import 'package:project/workout_tracker.dart';
import 'package:camera/camera.dart';

List<CameraDescription>? cameras;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.purple),
        debugShowCheckedModeBanner: false,
        home: Home());
  }
}
/*
git init
git add .
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Halla-yk/graduation_project.git
git push -u origin main*/