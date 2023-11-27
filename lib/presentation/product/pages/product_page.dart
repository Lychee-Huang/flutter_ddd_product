import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_products/application/di/di.dart';
import 'package:flutter_ddd_products/presentation/product/cubit/product_cubit.dart';
import 'package:flutter_ddd_products/presentation/product/pages/screen/product_screen.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di<ProductCubit>()..getProducts(),
      child: const ProductScreen(),
    );
  }
}
