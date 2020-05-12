
import 'package:flutter/material.dart';

    // Bloc
import 'package:zomatoblock/BLoC/bloc_provider.dart';
import 'package:zomatoblock/BLoC/location_bloc.dart';

    // Model
import 'package:zomatoblock/DataLayer/location.dart';


    // UI
import 'package:zomatoblock/UI/location_screen.dart';       //ENTER LOCATION.

import 'package:zomatoblock/UI/restaurant_screen.dart';     //ENTER RESTAURANT.


class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    /*
      Key key,
    this.initialData,
    Stream<T> stream,
    @required this.builder,
    */
    return StreamBuilder<Location>(
    //      stream: null,
    //      builder: (context, snapshot) {
    //        return LocationScreen();
    //      }

      stream: BlocProvider.of<LocationBloc>(context).locationStream,
    /* 1st iteration
    //      builder: (context, snapshot) {
    //        final location = snapshot.data;
    //
    //        // 2
    //        if (location == null) {
    //          return LocationScreen();
    //        }
    //
    //        // This will be changed this later
    //        return Container();
    //      },

    1st iteration ends here.
     */
      builder: (context, snapshot) {
        final location = snapshot.data;

        if (location == null) {
          return LocationScreen();
        }

        return RestaurantScreen(location: location);
      },


    );
  }
}