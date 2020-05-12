

  // BLOC
import 'package:zomatoblock/BLoC/bloc.dart';

  // MODEL.

import 'package:zomatoblock/DataLayer/location.dart';

  // DATA ACCESS CLASS.
import 'package:zomatoblock/DataLayer/zomato_client.dart';


  // DART PACKAGE.

import 'dart:async';



class LocationQueryBloc implements Bloc {

  final _controller = StreamController<List<Location>>();
  final _client = ZomatoClient();

  // CALLED LIKE THIS: stream: bloc.locationStream,
  Stream<List<Location>> get locationStream => _controller.stream;

  void submitQuery(String query) async {


    // 1
    final results = await _client.fetchLocations(query);


    // this method is called then Streams becomes populated with data.
    _controller.sink.add(results);


  }

  @override
  void dispose() {
    _controller.close();
  }


}