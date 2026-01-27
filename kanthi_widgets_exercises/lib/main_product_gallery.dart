// ============================================
// A custom widget MainProductGallery
//
// AI DOCUMENTATION
// Use AI for searching some syntax for text condition such as
// GridView builder, InkWell and some other because forgetfulness.
// And use AI for generate list of products and description about it.
//
// This code showing products card list by using GridView and user
// can interact with each card by click on it, the application will
// navigate user to product detail page that will amplify about products,
// and also has a button that allow user add product to card.
//
// @author Kanthi Phrakhienthong
// @version 1.0.
// @date 2026-01-27
// ============================================
import 'package:flutter/material.dart';
import 'models/product_model.dart';
import 'components/product_card.dart';
import 'screens/product_detail.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KKU Faculty',

      // Dark Theme Configuration //
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
          brightness: Brightness.dark,
        ),
      ),
      // Light Theme Configuration //
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
          brightness: Brightness.light,
        ),
      ),
      themeMode: ThemeMode.system,

      home: MainProductGallery(),
    );
  }
}

class MainProductGallery extends StatelessWidget {
  const MainProductGallery({super.key});

  @override
  Widget build(BuildContext context) {
    // Product Lists //
    final List<ProductModel> products = [
      ProductModel(
        id: 1,
        name: 'Wireless Headphones',
        price: 1290.00,
        imageUrl: 'assets/products/wireless_headphones.jpg',
        description:
            'High-quality wireless headphones with noise isolation and long battery life.',
        rating: 1.5,
      ),
      ProductModel(
        id: 2,
        name: 'Smart Watch Pro',
        price: 2490.00,
        imageUrl: 'assets/products/smart_watch_pro.jpg',
        description:
            'Advanced smartwatch with health tracking, notifications, and fitness modes.',
        rating: 4.2,
      ),
      ProductModel(
        id: 3,
        name: 'Portable Speaker',
        price: 890.00,
        imageUrl: 'assets/products/portable_speaker.jpg',
        description:
            'Compact Bluetooth speaker with powerful 360-degree sound and waterproof design.',
        rating: 2.4,
      ),
      ProductModel(
        id: 4,
        name: 'Laptop Stand',
        price: 590.00,
        imageUrl: 'assets/products/laptop_stand.jpg',
        description:
            'Ergonomic aluminum laptop stand for better posture and cooling.',
        rating: 4.6,
      ),
      ProductModel(
        id: 5,
        name: 'Mechanical Keyboard',
        price: 1890.00,
        imageUrl: 'assets/products/mechanical_keyboard.jpg',
        description:
            'Mechanical keyboard with tactile switches and RGB backlighting.',
        rating: 4.8,
      ),
      ProductModel(
        id: 6,
        name: 'Wireless Mouse',
        price: 690.00,
        imageUrl: 'assets/products/wireless_mouse.jpg',
        description:
            'Ergonomic wireless mouse with adjustable DPI and long battery life.',
        rating: 2.3,
      ),
      ProductModel(
        id: 7,
        name: 'USB-C Hub',
        price: 990.00,
        imageUrl: 'assets/products/USBC_hub.jpg',
        description:
            'Multi-port USB-C hub with HDMI, USB 3.0, and SD card support.',
        rating: 3.7,
      ),
      ProductModel(
        id: 8,
        name: 'Noise Cancelling Earbuds',
        price: 1590.00,
        imageUrl: 'assets/products/noise_cancelling_earbuds.jpg',
        description:
            'True wireless earbuds with active noise cancellation and clear sound.',
        rating: 4.4,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: Text(
          'Product Gallery by 663040109-6',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: products.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            childAspectRatio: 0.7,
          ),
          itemBuilder: (context, index) {
            return ProductCard(
              product: products[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetail(product: products[index]),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
