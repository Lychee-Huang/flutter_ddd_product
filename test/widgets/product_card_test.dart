import 'package:flutter/widgets.dart';
import 'package:flutter_ddd_products/domain/product/product.dart';
import 'package:flutter_ddd_products/presentation/widgets/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../helpers/helpers.dart';

void main() {
  const product = ProductEntity(
    id: 1,
    title: 'Product 1',
    price: 10,
    description: 'Description 1',
    images: [
      'https://images.unsplash.com/photo-1622835042209-8b3b6b0b0b0a?ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdCUyMGJsb2d8ZW58MHx8MHx8&ixlib=rb-1.2.1&w=1000&q=80',
    ],
  );

  testWidgets('Product Card created succesfully', (tester) async {
    await mockNetworkImagesFor(
      () async => tester.pumpApp(const ProductCard(product: product)),
    );

    expect(find.text(product.title), findsOneWidget);
    expect(find.text(product.description), findsNothing);
  });

  testWidgets('Product Card should have an image', (tester) async {
    await mockNetworkImagesFor(
      () async => tester.pumpApp(const ProductCard(product: product)),
    );

    expect(find.byType(Image), findsOneWidget);
  });
}
