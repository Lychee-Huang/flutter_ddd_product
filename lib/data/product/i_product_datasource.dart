import 'package:flutter_ddd_products/data/product/product_model.dart';

// ignore: one_member_abstracts
abstract class IProductDatasource {
  Future<(Exception?, List<ProductModel>?)> getProducts();
}
