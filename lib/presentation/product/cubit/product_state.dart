part of 'product_cubit.dart';

@freezed
class ProductState with _$ProductState {
  const factory ProductState.initial() = _Initial;

  const factory ProductState.loading() = _Loading;

  const factory ProductState.loaded(List<ProductEntity> products) = _Loaded;

  const factory ProductState.error(Failure failure) = _Error;
}
