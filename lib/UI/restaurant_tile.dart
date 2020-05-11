

import 'package:flutter/material.dart';
import 'package:zomatoblock/DataLayer/restaurant.dart';
import 'package:zomatoblock/UI/image_container.dart';
import 'package:zomatoblock/UI/restaurant_details_screen.dart';

class RestaurantTile extends StatelessWidget {
  const RestaurantTile({
    Key key,
    @required this.restaurant,
  }) : super(key: key);

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ImageContainer(width: 50, height: 50, url: restaurant.thumbUrl),
      title: Text(restaurant.name),
      trailing: Icon(Icons.keyboard_arrow_right),
//      onTap: ,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) =>
                RestaurantDetailsScreen(restaurant: restaurant),
          ),
        );
      },

    );
  }
}
