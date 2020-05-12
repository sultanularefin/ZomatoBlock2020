import 'package:flutter/material.dart';
import 'package:zomatoblock/BLoC/bloc_provider.dart';
import 'package:zomatoblock/BLoC/favorite_bloc.dart';
import 'package:zomatoblock/BLoC/location_bloc.dart';
//import 'package:zomatoblock/DataLayer/location.dart';
import 'package:zomatoblock/UI/main_screen.dart';



// void main() => runApp(RestaurantFinder());


void main() {
 // runApp(MyApp());
 
 runApp(RestaurantFinder());
}

class RestaurantFinder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
//    IT 1
    /*
    return BlocProvider<LocationBloc>(
      bloc: LocationBloc(),
      child: MaterialApp(
        title: 'Restaurant Finder',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
//      home: Container(),
          home: MainScreen(),
      ),
    );

    */


//    class BlocProvider<T extends Bloc> extends StatefulWidget {
//
//    final Widget child;
//    final T bloc;

    return BlocProvider<LocationBloc>(
      bloc: LocationBloc(),
      child: BlocProvider<FavoriteBloc>(
        bloc: FavoriteBloc(),
        child: MaterialApp(
          title: 'Restaurant Finder',
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          home: MainScreen(),
        ),
      ),
    );

  }
}
