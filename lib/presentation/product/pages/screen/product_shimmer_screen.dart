import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProductShimmerScreen extends StatelessWidget {
  const ProductShimmerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: 20,
      itemBuilder: (context, index) {
        return Card(
          child: Shimmer.fromColors(
            baseColor: Colors.grey.shade200,
            highlightColor: Colors.grey.shade300,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
