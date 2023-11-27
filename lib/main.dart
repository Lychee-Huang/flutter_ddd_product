import 'package:flutter/material.dart';
import 'package:flutter_ddd_products/application/di/di.dart';
import 'package:flutter_ddd_products/presentation/product/pages/product_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: ProductPage(),
      ),
    );
  }
}
