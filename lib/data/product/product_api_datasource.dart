import 'package:dio/dio.dart';
import 'package:flutter_ddd_products/data/core/exceptions.dart';
import 'package:flutter_ddd_products/data/product/i_product_datasource.dart';
import 'package:flutter_ddd_products/data/product/product_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: IProductDatasource)
class ProductApiDatasource extends IProductDatasource {
  ProductApiDatasource({required this.dio});
  final Dio dio;

  @override
  Future<(Exception?, List<ProductModel>?)> getProducts() async {
    try {
      // ignore: inference_failure_on_function_invocation
      final response = await dio.get('/products');
      final products = response.data as List;
      final productsList = products
          .map<ProductModel>(
            (product) => ProductModel.fromJson(product as Map<String, dynamic>),
          )
          .toList();
      return (null, productsList);
    } on DioException catch (_) {
      return (const Exceptions.serverError(), null);
    } catch (_) {
      return (const Exceptions.unexpectedError(), null);
    }
  }
}
