import 'package:dio/dio.dart';
import 'package:flutter_ddd_products/data/product/i_product_datasource.dart';
import 'package:flutter_ddd_products/domain/core/failures.dart';
import 'package:flutter_ddd_products/domain/product/product.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IProductRepository)
class ProductRepository implements IProductRepository {
  ProductRepository({
    required this.dio,
    required this.productDatasource,
  });
  final Dio dio;
  final IProductDatasource productDatasource;

  @override
  Future<(Failure?, List<ProductEntity>?)> getProducts() async {
    final (exception, products) = await productDatasource.getProducts();
    if (exception != null) {
      if (exception is ServerError) {
        return (const ServerError(), null);
      } else if (exception is UnexpectedError) {
        return (const UnexpectedError(), null);
      }
    }
    final productsList =
        products!.map((product) => product.toEntity()).toList();
    return (null, productsList);
  }
}
