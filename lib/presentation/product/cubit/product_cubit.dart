import 'package:bloc/bloc.dart';
import 'package:flutter_ddd_products/application/usecases/product_usecase.dart';
import 'package:flutter_ddd_products/domain/core/failures.dart';
import 'package:flutter_ddd_products/domain/product/product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'product_state.dart';
part 'product_cubit.freezed.dart';

@injectable
class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this.productUsecase) : super(const ProductState.initial());

  final ProductUsecase productUsecase;

  Future<void> getProducts() async {
    emit(const ProductState.loading());
    final (error, products) = await productUsecase.getProducts();

    if (error != null) {
      emit(ProductState.error(error));
    } else {
      emit(ProductState.loaded(products ?? []));
    }
  }
}
