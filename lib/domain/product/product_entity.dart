import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_entity.freezed.dart';

@freezed
class ProductEntity with _$ProductEntity {
  const factory ProductEntity({
    required int id,
    required String title,
    required int price,
    required String description,
    required List<String> images,
  }) = _ProductEntity;
  const ProductEntity._();
}

@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required int id,
    required String name,
  }) = _CategoryEntity;
  const CategoryEntity._();
}
