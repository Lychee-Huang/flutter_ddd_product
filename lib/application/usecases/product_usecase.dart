import 'package:flutter_ddd_products/domain/core/failures.dart';
import 'package:flutter_ddd_products/domain/product/product.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductUsecase {
  final IProductRepository productRepository;

  ProductUsecase(this.productRepository);

  Future<(Failure?, List<ProductEntity>?)> getProducts() async {
    try {
      return await productRepository.getProducts();
    } catch (_) {
      return (Failure.unexpectedError(), null);
    }
  }
}
