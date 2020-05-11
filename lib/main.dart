import 'package:flutter/material.dart';
import 'package:zomatoblock/UI/main_screen.dart';



// void main() => runApp(RestaurantFinder());


void main() {
 // runApp(MyApp());
 
 runApp(RestaurantFinder());
}

class RestaurantFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Restaurant Finder',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
//      home: Container(),
        home: MainScreen(),
    );
  }
}
