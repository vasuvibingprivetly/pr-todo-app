import 'package:flutter/material.dart';
import 'package:to_do_app/utils/route_utils.dart';
import 'package:to_do_app/views/screens/home_page.dart';

void main(){
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        Routes.homePage: (context) => const HomePage(),
      },
    );
  }
}

