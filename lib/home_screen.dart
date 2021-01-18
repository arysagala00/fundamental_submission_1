import 'package:flutter/material.dart';
import 'package:fundamental_submission_1/detail_restaurant.dart';
import 'package:fundamental_submission_1/restaurant.dart';

class HomePage extends StatelessWidget {
  static const routeName = '/home_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Restaurant App',
        ),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          final List<Restaurant> restaurants = parseRestaurant(snapshot.data);
          return restaurants.length < 1
              ? Center(
                  child: Text('Data tidak ditemukan'),
                )
              : ListView.builder(
                  itemCount: restaurants.length,
                  itemBuilder: (context, index) {
                    return _buildRestaurantItem(context, restaurants[index]);
                  },
                );
        },
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
    return ListTile(
      contentPadding:
          const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      leading: Hero(
        tag: restaurant.pictureId,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.network(
            restaurant.pictureId,
            width: 100,
          ),
        ),
      ),
      isThreeLine: true,
      title: Text(
        restaurant.name,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Column(
        children: [
          Row(
            children: [
              Icon(Icons.location_on),
              SizedBox(
                width: 4,
              ),
              Text(restaurant.city)
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.star,
                color: Colors.yellow,
              ),
              SizedBox(
                width: 4,
              ),
              Text(restaurant.rating)
            ],
          )
        ],
      ),
      onTap: () {
        Navigator.pushNamed(context, RestaurantDetail.routeName,
            arguments: restaurant);
      },
    );
  }
}
