

import 'package:zomatoblock/BLoC/bloc.dart';
import 'package:zomatoblock/DataLayer/location.dart';
import 'dart:async';

class LocationBloc implements Bloc {
  // id ,type ,title <= Location.

  Location _location;

  //  getter for the above may be

  Location get selectedLocation => _location;

  //  The => expr syntax is a shorthand for { return expr; }.
  //  The => notation is sometimes referred to as arrow syntax.

  // 1
  final _locationController = StreamController<Location>();

  // 2

  // getter that get's the stream with _locationController.stream;

  // CALLED LIKE THIS: stream: BlocProvider.of<LocationBloc>(context).locationStream,

  Stream<Location> get locationStream => _locationController.stream;



  // 3
  // CALLED LIKE THIS:

  //  lib/UI/location_screen.dart:119:            locationBloc.selectLocation(location);
  //  lib/UI/location_screen.dart:131:            locationBloc.selectLocation(location);

  void selectLocation(Location location) {
    _location = location;
    _locationController.sink.add(location);
  }

  // 4
  @override
  void dispose() {
    _locationController.close();
  }
}