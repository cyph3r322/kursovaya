import 'package:flutter/material.dart';
import '../models/restaurant.dart';

class RestaurantDetailScreen extends StatelessWidget {
  final Restaurant restaurant;

  RestaurantDetailScreen({required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
      ),
      body: ListView.builder(
        itemCount: restaurant.menu.length,
        itemBuilder: (context, index) {
          final foodItem = restaurant.menu[index];
          return ListTile(
            title: Text(foodItem.name),
            subtitle: Text('₽{foodItem.description}'),
            trailing: Text('₽{foodItem.price} ₽'), // Убрали значок доллара
          );
        },
      ),
    );
  }
}