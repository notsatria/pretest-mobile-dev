import 'package:flutter/material.dart';
import 'package:pretest_suitmedia/screens/first_screen.dart';
import 'package:pretest_suitmedia/screens/second_screen.dart';
import 'package:pretest_suitmedia/screens/third_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const FirstScreen(),
        SecondScreen.routeName: (context) => SecondScreen(),
        ThirdScreen.routeName: (context) => const ThirdScreen(),
      },
    );
  }
}
