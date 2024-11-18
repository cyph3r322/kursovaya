class Restaurant {
  final String id;
  final String name;
  final String imageUrl;
  final List<FoodItem> menu;

  Restaurant({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.menu,
  });
}

class FoodItem {
  final String id;
  final String name;
  final double price;
  final String description;
  final String category; // Новое поле

  FoodItem({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
  });
}