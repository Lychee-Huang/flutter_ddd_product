import 'package:flutter_ddd_products/domain/product/product_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'product_model.freezed.dart';
part 'product_model.g.dart';

@freezed
class ProductModel with _$ProductModel {
  const factory ProductModel({
    required int id,
    required String title,
    required int price,
    required String description,
    required List<String> images,
    required String creationAt,
    required String updatedAt,
    required CategoryModel category,
  }) = _ProductModel;
  const ProductModel._();

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  ProductEntity toEntity() => ProductEntity(
        id: id,
        title: title,
        price: price,
        description: description,
        images: images,
      );
}

@freezed
class CategoryModel with _$CategoryModel {
  const factory CategoryModel({
    required int id,
    required String name,
    required String image,
    required String creationAt,
    required String updatedAt,
  }) = _CategoryModel;
  const CategoryModel._();

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  CategoryEntity toEntity() => CategoryEntity(
        id: id,
        name: name,
      );
}
