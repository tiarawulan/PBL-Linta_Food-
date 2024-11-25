import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Lintau Food',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[100],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lintau Food\nFood Delivery',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Memberikan referensi makanan\nTigo Jangko dan Sekitar',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DashboardPage()),
                );
              },
              child: Text('Next'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DashboardPage extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants = [
    {'name': 'Etek Geprek', 'image': 'assets/etek_geprek.jpg', 'rating': 5},
    {
      'name': 'Geprek Nusantara',
      'image': 'assets/geprek_nusantara.jpg',
      'rating': 4
    },
    {'name': 'Cindomato', 'image': 'assets/cindomato.jpg', 'rating': 5},
    {'name': 'Oishi', 'image': 'assets/oishi.jpg', 'rating': 4},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.teal,
      ),
      body: ListView.builder(
        itemCount: restaurants.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset(
                restaurants[index]['image'],
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(restaurants[index]['name']),
              subtitle: Text('Rating: ${restaurants[index]['rating']} ⭐'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MenuPage(restaurant: restaurants[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class MenuPage extends StatelessWidget {
  final Map<String, dynamic> restaurant;

  MenuPage({required this.restaurant});

  final List<Map<String, String>> menuItems = [
    {'name': 'Ayam Geprek Komplit + Nasi', 'price': '20k'},
    {'name': 'Ayam Goreng + Nasi', 'price': '15k'},
    {'name': 'Nasi Goreng Special', 'price': '18k'},
    {'name': 'Ikan Asin Komplit', 'price': '12k'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant['name']),
        backgroundColor: Colors.teal,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              restaurant['image'],
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Pilihan Menu',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: menuItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(menuItems[index]['name']!),
                  trailing: Text(menuItems[index]['price']!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
