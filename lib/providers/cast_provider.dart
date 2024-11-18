import 'package:flutter/material.dart';
import '../data/restaurants.dart';

class CartProvider with ChangeNotifier {
  final List<FoodItem> _items = [];

  List<FoodItem> get items => _items;

  double get totalPrice =>
      _items.fold(0, (total, item) => total + item.price);

  void addToCart(FoodItem item) {
    _items.add(item);
    notifyListeners();
  }

  void removeFromCart(FoodItem item) {
    _items.remove(item);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
