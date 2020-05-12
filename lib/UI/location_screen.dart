

import 'package:flutter/material.dart';

      // Block
import 'package:zomatoblock/BLoC/bloc_provider.dart';
import 'package:zomatoblock/BLoC/location_bloc.dart';
import 'package:zomatoblock/BLoC/location_query_bloc.dart';


      // Modle.
import 'package:zomatoblock/DataLayer/location.dart';


class LocationScreen extends StatelessWidget {


  final bool isFullScreenDialog;

  const LocationScreen({Key key, this.isFullScreenDialog = false})
      : super(key: key);


  // 1ST ITERATION.
  /*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Where do you want to eat?')),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: 'Enter a location'),
              onChanged: (query) { },
            ),
          ),
          Expanded(
            child: _buildResults(),
          )
        ],
      ),
    );
  }
*/

  @override
  Widget build(BuildContext context) {
    // 1
    //First, the app instantiates a new LocationQueryBloc at the top of the build method.
    final bloc = LocationQueryBloc();

//    LocationQueryBloc

//    The BLoC is then stored in a BlocProvider, which will manage its lifecycle.
    // 2

//    return StreamBuilder<Location>(
    return BlocProvider<LocationQueryBloc>(
      bloc: bloc,
      child: Scaffold(
        appBar: AppBar(title: Text('Where do you want to eat?')),
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter a location'),

                // 3
                onChanged: (query) => bloc.submitQuery(query),
              ),
            ),
            // 4
            Expanded(
              child: _buildResults(bloc),
            )
          ],
        ),
      ),
    );
  }


//  Widget _buildResults() {
//    return Center(child: Text('Enter a location'));
//  }

  Widget _buildResults(LocationQueryBloc bloc) {
    return StreamBuilder<List<Location>>(
      stream: bloc.locationStream,
      builder: (context, snapshot) {

        // 1
        final results = snapshot.data;

        if (results == null) {
          return Center(child: Text('Enter a location'));
        }

        if (results.isEmpty) {
          return Center(child: Text('No Results'));
        }

        return _buildSearchResults(results);
      },
    );
  }

  Widget _buildSearchResults(List<Location> results) {
    // 2
    return ListView.separated(
      itemCount: results.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        final location = results[index];
        return ListTile(
          title: Text(location.title),
          // Iteration 01.
          /*
          onTap: () {
            // 3
            final locationBloc = BlocProvider.of<LocationBloc>(context);
            locationBloc.selectLocation(location);

            if (isFullScreenDialog) {
              Navigator.of(context).pop();
            }
          },
          */

          // Same no iteration.


          // stream: BlocProvider.of<LocationBloc>(context).locationStream, IN OUR MAINSCREEN.

          onTap: () {
            final locationBloc = BlocProvider.of<LocationBloc>(context);
            locationBloc.selectLocation(location);

            print('isFullScreenDialog:  $isFullScreenDialog');

            // but isFullScreenDialog is false set, as defaultParameter.

            if (isFullScreenDialog) {
              Navigator.of(context).pop();
              // returns to the previous screen which is main_screen. then based on the
              // condition get's to here: RestaurantScreen(location: location);
            }

          },


        );
      },
    );
  }
}