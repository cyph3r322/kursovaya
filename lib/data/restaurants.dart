class FoodItem {
  final String id;
  final String name;
  final double price;
  final String description;
  final String category;

  FoodItem({
    required this.id,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
  });
}

class Restaurant {
  final String name;
  final List<FoodItem> menu;

  Restaurant({required this.name, required this.menu});
}

final List<Restaurant> restaurants = [
  Restaurant(
    name: 'Бургерная',
    menu: [
      FoodItem(
        id: '1',
        name: 'Чизбургер',
        price: 250.0,
        description: 'Классический бургер с сыром.',
        category: 'burgers',
      ),
      FoodItem(
        id: '2',
        name: 'Дабл бургер',
        price: 350.0,
        description: 'Бургер с двойной котлетой и сыром.',
        category: 'burgers',
      ),
      FoodItem(
        id: '3',
        name: 'Веганский бургер',
        price: 300.0,
        description: 'Бургер с растительной котлетой.',
        category: 'burgers',
      ),
    ],
  ),
  Restaurant(
    name: 'Суши-бар',
    menu: [
      FoodItem(
        id: '4',
        name: 'Филадельфия',
        price: 450.0,
        description: 'Роллы с лососем и сливочным сыром.',
        category: 'sushi',
      ),
      FoodItem(
        id: '5',
        name: 'Калифорния',
        price: 400.0,
        description: 'Роллы с крабом и авокадо.',
        category: 'sushi',
      ),
      FoodItem(
        id: '6',
        name: 'Ролл с угрём',
        price: 500.0,
        description: 'Роллы с копчёным угрём и соусом унаги.',
        category: 'sushi',
      ),
    ],
  ),
  Restaurant(
    name: 'Пиццерия',
    menu: [
      FoodItem(
        id: '7',
        name: 'Маргарита',
        price: 600.0,
        description: 'Классическая пицца с томатами и сыром моцарелла.',
        category: 'pizza',
      ),
      FoodItem(
        id: '8',
        name: 'Пепперони',
        price: 700.0,
        description: 'Острая пицца с колбасой пепперони.',
        category: 'pizza',
      ),
      FoodItem(
        id: '9',
        name: 'Гавайская',
        price: 650.0,
        description: 'Пицца с ананасами и ветчиной.',
        category: 'pizza',
      ),
    ],
  ),
  Restaurant(
    name: 'Кафе десертов',
    menu: [
      FoodItem(
        id: '10',
        name: 'Чизкейк',
        price: 350.0,
        description: 'Сливочный чизкейк с клубничным соусом.',
        category: 'desserts',
      ),
      FoodItem(
        id: '11',
        name: 'Тирамису',
        price: 400.0,
        description: 'Итальянский десерт с кофе и маскарпоне.',
        category: 'desserts',
      ),
      FoodItem(
        id: '12',
        name: 'Шоколадный торт',
        price: 450.0,
        description: 'Торт с насыщенным шоколадным вкусом.',
        category: 'desserts',
      ),
    ],
  ),
  Restaurant(
    name: 'Напитки на выбор',
    menu: [
      FoodItem(
        id: '13',
        name: 'Кола',
        price: 100.0,
        description: 'Газированный напиток.',
        category: 'drinks',
      ),
      FoodItem(
        id: '14',
        name: 'Лимонад',
        price: 120.0,
        description: 'Освежающий лимонад.',
        category: 'drinks',
      ),
      FoodItem(
        id: '15',
        name: 'Чай',
        price: 80.0,
        description: 'Чёрный или зелёный чай.',
        category: 'drinks',
      ),
    ],
  ),
  Restaurant(
    name: 'Кафе супов',
    menu: [
      FoodItem(
        id: '16',
        name: 'Борщ',
        price: 300.0,
        description: 'Традиционный украинский суп с буряком.',
        category: 'soups',
      ),
      FoodItem(
        id: '17',
        name: 'Крем-суп из грибов',
        price: 350.0,
        description: 'Сливочный суп с шампиньонами.',
        category: 'soups',
      ),
      FoodItem(
        id: '18',
        name: 'Куриный суп',
        price: 250.0,
        description: 'Лёгкий суп с курицей и овощами.',
        category: 'soups',
      ),
    ],
  ),
];
