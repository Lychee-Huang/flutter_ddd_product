import 'package:flutter/material.dart';
import 'package:flutter_ddd_products/domain/product/product_entity.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({required this.product, super.key});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              product.images.first,
              fit: BoxFit.cover,
            ),
          ),
          Text(product.title),
        ],
      ),
    );
  }
}
