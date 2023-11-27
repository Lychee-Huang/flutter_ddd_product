import 'package:flutter_ddd_products/domain/core/failures.dart';
import 'package:flutter_ddd_products/domain/product/product_entity.dart';

// ignore: one_member_abstracts
abstract class IProductRepository {
  Future<(Failure?, List<ProductEntity>?)> getProducts();
}
