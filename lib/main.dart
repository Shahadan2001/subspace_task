import 'package:flutter/material.dart';
import 'package:task/screens/home/home_screen.dart';
import 'package:task/utils/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Task',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xff20726a))),
      // home: HomeScreen()
      routerConfig: taskRouter,
    );
  }
}


