import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_ddd_products/presentation/product/cubit/product_cubit.dart';
import 'package:flutter_ddd_products/presentation/product/pages/screen/product_shimmer_screen.dart';
import 'package:flutter_ddd_products/presentation/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<ProductCubit>().getProducts();
        },
        child: const Icon(Icons.refresh),
      ),
      body: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          state.maybeMap(
            error: (error) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(error.failure.toString()),
                ),
              );
            },
            orElse: () {},
          );
        },
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: state.maybeMap(
              loading: (_) => const ProductShimmerScreen(),
              loaded: (loaded) => GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: loaded.products.length,
                itemBuilder: (context, index) {
                  final product = loaded.products[index];
                  return ProductCard(product: product);
                },
              ),
              error: (error) => Center(
                child: Text(error.failure.toString()),
              ),
              orElse: () => const SizedBox.shrink(),
            ),
          );
        },
      ),
    );
  }
}
