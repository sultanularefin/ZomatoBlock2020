import 'package:zomatoblock/BLoC/bloc.dart';
import 'package:zomatoblock/DataLayer/location.dart';
import 'package:zomatoblock/DataLayer/zomato_client.dart';
import 'dart:async';



class LocationQueryBloc implements Bloc {
  final _controller = StreamController<List<Location>>();
  final _client = ZomatoClient();
  Stream<List<Location>> get locationStream => _controller.stream;

  void submitQuery(String query) async {
    // 1
    final results = await _client.fetchLocations(query);
    _controller.sink.add(results);
  }

  @override
  void dispose() {
    _controller.close();
  }
}