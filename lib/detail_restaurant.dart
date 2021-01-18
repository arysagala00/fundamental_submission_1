import 'package:flutter/material.dart';
import 'package:fundamental_submission_1/restaurant.dart';

class RestaurantDetail extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetail({@required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restaurant App'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: restaurant.pictureId,
                child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                        bottomRight: Radius.circular(8)),
                    child: Image.network(restaurant.pictureId))),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            restaurant.city,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      SizedBox(
                          width: (MediaQuery.of(context).size.width * 0.93),
                          child: Text(
                            restaurant.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 5,
                          )),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: (MediaQuery.of(context).size.height * 0.2),
                        width: (MediaQuery.of(context).size.width * 0.93),
                        child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: restaurant.menus.foods.map((foods) {
                              return InkWell(
                                child: Card(
                                  elevation: 2,
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  restaurant.pictureId))),
                                      child: Text(foods.name),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  // Find the Scaffold in the widget tree and use
                                  // it to show a SnackBar.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Anda memilih ${foods.name}'),
                                    ),
                                  );
                                },
                              );
                            }).toList()),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        height: (MediaQuery.of(context).size.height * 0.15),
                        width: (MediaQuery.of(context).size.width * 0.93),
                        child: ListView(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            children: restaurant.menus.drinks.map((drinks) {
                              return InkWell(
                                child: SizedBox(
                                  width: 150.0,
                                  height: 250.0,
                                  child: Card(
                                    elevation: 2,
                                    child: Padding(
                                      padding: EdgeInsets.all(16),
                                      child: Container(
                                        child: Center(child: Text(drinks.name)),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  // Find the Scaffold in the widget tree and use
                                  // it to show a SnackBar.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content:
                                          Text('Anda memilih ${drinks.name}'),
                                    ),
                                  );
                                },
                              );
                            }).toList()),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
