
//import 'package:flutter/material.dart';
//import 'package:zomatoblock/BLoC/bloc_provider.dart';
//import 'package:zomatoblock/BLoC/location_bloc.dart';
//import 'package:zomatoblock/BLoC/location_query_bloc.dart';
//
import 'package:zomatoblock/DataLayer/restaurant.dart';

import 'package:zomatoblock/BLoC/bloc.dart';
import 'dart:async';


/*
#### keep track of their favorite restaurants
and show those in a separate list
*/

/*
```json
Favoriting Restaurants
So far, the BLoC pattern has been used to manage user input, but it can be used
 for so much more. Let’s say the user want to keep track of their favorite restaurants
and show those in a separate list. That too can be solved with the BLoC pattern.
```
*/


class FavoriteBloc implements Bloc {

  var _restaurants = <Restaurant>[];

  // LIKE THIS: _restaurants.add(restaurant);
  //  IT HOLDS FAVORITE RESTAURANTS


  //  dart array
  //  https://www.educative.io/edpresso/how-to-create-an-array-in-dart
  // methods are: first()  last()  isEmpty() length()


  // a getter that returns all the Restaurant values from _restaurant Array || List.

  // INVOKER:  initialData: bloc.favorites,
  List<Restaurant> get favorites => _restaurants;


  // FOR location_bloc => final _locationController = StreamController<Location>();
  // [NORMAL STREAM, BELOW IS THE BROADCAST STREAM].

  // FOR location_bloc => Stream<Location> get locationStream => _locationController.stream;

  // getter that get's the stream with _locationController.stream;
  //  Stream<Location> get locationStream => _locationController.stream;

  // declartion and access.


  //  How it know's from the Restaurant array that these are favorites;

  // 1
  final _controller = StreamController<List<Restaurant>>.broadcast();

//  FavoriteBloc
//  1. lib/UI/restaurant_details_screen.dart
//  2.lib/UI/favorite_screen.dart


  // INVOKER -> stream: bloc.favoritesStream,
  Stream<List<Restaurant>> get favoritesStream => _controller.stream;

  void toggleRestaurant(Restaurant restaurant) {
    if (_restaurants.contains(restaurant)) {
      _restaurants.remove(restaurant);
    } else {
      _restaurants.add(restaurant);
    }

    _controller.sink.add(_restaurants);
  }

  @override
  void dispose() {
    _controller.close();
  }
}
