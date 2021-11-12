import 'package:anime_project/pages/anime_page.dart';
import 'package:anime_project/pages/detail_page.dart';
import 'package:anime_project/pages/home.dart';
import 'package:anime_project/pages/vedio_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      routes: {
        HomePage.routeName : (context) => const HomePage(),
        AnimePage.routeName : (context) =>  AnimePage(),
        Detail.routeName : (context) =>  Detail(),
        Video.routeName : (context) =>  Video(),


      },
      initialRoute: '/home',
    );
  }
}

