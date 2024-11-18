import 'package:flutter/material.dart';
import '../data/restaurants.dart';

class HomeScreen extends StatefulWidget {
  final String email;

  const HomeScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  // Список корзины
  final List<Map<String, dynamic>> _cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildHomeScreen(),
          _buildCartScreen(),
          _buildProfileScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF4facfe),
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }

  Widget _buildHomeScreen() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Food Delivery'),
        centerTitle: true,
        backgroundColor: const Color(0xFF4facfe),
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
 
          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Text(
              'Категории',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
children: [
                  _buildCategoryCard(
                    context,
                    'Бургеры',
                    Icons.fastfood,
                    Colors.red,
                    'burgers',
                  ),
                  _buildCategoryCard(
                    context,
                    'Суши',
                    Icons.rice_bowl,
                    Colors.orange,
                    'sushi',
                  ),
                  _buildCategoryCard(
                    context,
                    'Пицца',
                    Icons.local_pizza,
                    Colors.green,
                    'pizza',
                  ),
                  _buildCategoryCard(
                    context,
                    'Десерты',
                    Icons.cake,
                    Colors.purple,
                    'desserts',
                  ),
                  _buildCategoryCard(
                    context,
                    'Напитки',
                    Icons.local_drink,
                    Colors.blue,
                    'drinks',
                  ),
                  _buildCategoryCard(
                    context,
                    'Супы',
                    Icons.soup_kitchen,
                    Colors.teal,
                    'soups',
                  ),
                ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(
      BuildContext context, String title, IconData icon, Color color, String category) {
    return GestureDetector(
      onTap: () {
        _showCategoryDialog(context, title, category);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 36, color: color),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

Widget _buildCartScreen() {
  // Вычисляем общую сумму
  final totalPrice = _cartItems.fold<double>(
    0,
    (sum, item) => sum + (item['price'] as double),
  );

  return Scaffold(
    appBar: AppBar(
      title: const Text('Корзина'),
      centerTitle: true,
      backgroundColor: const Color(0xFF4facfe),
    ),
    body: _cartItems.isEmpty
        ? const Center(
            child: Text(
              'Корзина пуста',
              style: TextStyle(fontSize: 18),
            ),
          )
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: _cartItems.length,
                  itemBuilder: (context, index) {
                    final item = _cartItems[index];
                    return ListTile(
                      title: Text(item['name']),
                      subtitle: Text('${item['price'].toStringAsFixed(2)} ₽'),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle, color: Colors.red),
                        onPressed: () {
                          setState(() {
                            _cartItems.removeAt(index);
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                color: Colors.white,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Итого:',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        Text(
                          '${totalPrice.toStringAsFixed(2)} ₽',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF4facfe),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    ElevatedButton(
                      onPressed: () {
                        _showPaymentDialog(context, totalPrice);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4facfe),
                        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                      ),
                      child: const Text(
                        'Оплатить',
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
  );
}

void _showPaymentDialog(BuildContext context, double totalPrice) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Выберите способ оплаты'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.credit_card, color: Colors.blue),
              title: const Text('Оплата картой'),
              onTap: () {
                Navigator.pop(context);
                _showConfirmationDialog(context, 'Оплата картой', totalPrice);
              },
            ),
            ListTile(
              leading: const Icon(Icons.location_on, color: Colors.green),
              title: const Text('Оплата на месте'),
              onTap: () {
                Navigator.pop(context);
                _showConfirmationDialog(context, 'Оплата на месте', totalPrice);
              },
            ),
          ],
        ),
      );
    },
  );
}

void _showConfirmationDialog(BuildContext context, String paymentMethod, double totalPrice) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Подтверждение заказа'),
        content: Text(
          'Вы выбрали "$paymentMethod" на сумму ${totalPrice.toStringAsFixed(2)} ₽.\n\nПродолжить?',
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Ваш заказ на сумму ${totalPrice.toStringAsFixed(2)} ₽ успешно оформлен!'),
                  backgroundColor: Colors.green,
                ),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF4facfe)),
            child: const Text('Подтвердить'),
          ),
        ],
      );
    },
  );
}


Widget _buildProfileScreen() {
  // Временные данные для пользователя
  String firstName = 'Имя';
  String lastName = 'Фамилия';
  String phoneNumber = 'Ваш номер телефона';
  List<Map<String, dynamic>> orderHistory = [
    {'date': '18.11.2024', 'total': 1500.0},
    {'date': '15.11.2024', 'total': 800.0},
  ];

  return Scaffold(
    appBar: AppBar(
      title: const Text('Личный кабинет'),
      centerTitle: true,
      backgroundColor: const Color(0xFF4facfe),
    ),
    body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Аватар
            GestureDetector(
              onTap: () {
                _selectAvatar();
              },
              child: CircleAvatar(
                radius: 50,
                backgroundColor: Colors.grey[300],
                child: const Icon(Icons.person, size: 50, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Нажмите, чтобы изменить аватар',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 24),

            // Имя и фамилия
            TextField(
              decoration: InputDecoration(
                labelText: 'Имя',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                firstName = value;
              },
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Фамилия',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                lastName = value;
              },
            ),
            const SizedBox(height: 16),

            // Номер телефона
            TextField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Номер телефона',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                phoneNumber = value;
              },
            ),
            const SizedBox(height: 24),

            // История заказов
            const Text(
              'История заказов',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: orderHistory.length,
              itemBuilder: (context, index) {
                final order = orderHistory[index];
                return ListTile(
                  leading: const Icon(Icons.receipt, color: Color(0xFF4facfe)),
                  title: Text('Заказ от ${order['date']}'),
                  trailing: Text('${order['total'].toStringAsFixed(2)} ₽'),
                );
              },
            ),
          ],
        ),
      ),
    ),
  );
}

void _selectAvatar() {
  // Здесь можно интегрировать функционал для загрузки аватара
  // Например, через Image Picker.
  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
      content: Text('Выбор аватара в разработке.'),
    ),
  );
}

  void _showCategoryDialog(BuildContext context, String title, String category) {
    final items = restaurants
        .expand((restaurant) => restaurant.menu)
        .where((item) => item.category == category)
        .toList();

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) {
        return Container(
          padding: const EdgeInsets.all(16),
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return ListTile(
                title: Text(item.name),
                subtitle: Text(item.description),
                trailing: Text('${item.price.toStringAsFixed(2)} ₽'),
                onTap: () {
                  setState(() {
                    _cartItems.add({'name': item.name, 'price': item.price});
                  });
                  Navigator.pop(context);
                },
              );
            },
          ),
        );
      },
    );
  }
}