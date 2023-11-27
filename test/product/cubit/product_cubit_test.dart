import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_ddd_products/application/usecases/product_usecase.dart';
import 'package:flutter_ddd_products/domain/core/failures.dart';
import 'package:flutter_ddd_products/domain/product/product.dart';
import 'package:flutter_ddd_products/presentation/product/cubit/product_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductUsecase extends Mock implements ProductUsecase {}

void main() {
  final mockProducts = <ProductEntity>[
    const ProductEntity(
      id: 1,
      title: 'Product 1',
      description: 'Description 1',
      price: 100,
      images: [
        'https://images.unsplash.com/photo-1622835042209-8b3b6b0b0b0a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdCUyMGJsb2d8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
      ],
    ),
    const ProductEntity(
      id: 2,
      title: 'Product 2',
      description: 'Description 2',
      price: 200,
      images: [
        'https://images.unsplash.com/photo-1622835042209-8b3b6b0b0b0a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdCUyMGJsb2d8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
      ],
    ),
  ];
  group('ProductCubit', () {
    late ProductCubit productCubit;
    late MockProductUsecase mockProductUsecase;

    setUp(() {
      mockProductUsecase = MockProductUsecase();
      productCubit = ProductCubit(mockProductUsecase);
    });

    test('initial state is ProductState.initial()', () {
      expect(productCubit.state, const ProductState.initial());
    });

    group('getProducts', () {
      blocTest<ProductCubit, ProductState>(
        'emits [ProductState.loading(), ProductState.success()] when successful',
        build: () {
          when(() => mockProductUsecase.getProducts())
              .thenAnswer((_) async => Future.value((null, mockProducts)));
          return productCubit;
        },
        act: (cubit) => cubit.getProducts(),
        expect: () => [
          const ProductState.loading(),
          ProductState.loaded(mockProducts),
        ],
        verify: (_) {
          verify(() => mockProductUsecase.getProducts()).called(1);
        },
      );

      blocTest<ProductCubit, ProductState>(
        'emits [ProductState.loading(), ProductState.error()] when unsuccessful',
        build: () {
          when(() => mockProductUsecase.getProducts()).thenAnswer(
            (_) async => Future.value((const NetworkError(), null)),
          );
          return productCubit;
        },
        act: (cubit) => cubit.getProducts(),
        expect: () => [
          const ProductState.loading(),
          const ProductState.error(NetworkError()),
        ],
        verify: (_) {
          verify(() => mockProductUsecase.getProducts()).called(1);
        },
      );
    });
  });
}
