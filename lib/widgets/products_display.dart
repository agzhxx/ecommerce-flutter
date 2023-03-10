import 'package:ecommerce/app/pages/product/product_detail.dart';
import 'package:ecommerce/app/pages/providers.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'empty_widget.dart';

extension StringCasingExtension on String {
  String toCapitalized() =>
      length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String toTitleCase() => replaceAll(RegExp(' +'), ' ')
      .split(' ')
      .map((str) => str.toCapitalized())
      .join(' ');
}

class ProductsDisplay extends ConsumerWidget {
  const ProductsDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamBuilder<List<Product>>(
      stream: ref.read(databaseProvider)!.getProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active &&
            snapshot.data != null) {
          // check if connection is active and there is something inside
          if (snapshot.data!.isEmpty) {
            // check if data coming is empty
            return const EmptyWidget();
          }
          return SizedBox(
            height: MediaQuery.of(context).size.height, // give it a height
            child: GridView.builder(
              scrollDirection: Axis.vertical, // lays down vertically
              itemCount: snapshot.data?.length, // number of items
              shrinkWrap: true, // shrink wrap to true
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),

              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetail(product: product)));
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Hero(
                            tag: product.name,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                product.imageUrl,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          product.name.toCapitalized(),
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "\$" + product.price.toString(),
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.primary,
                              fontWeight: FontWeight.bold,
                              fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        }
        return const Center(
            child: CircularProgressIndicator()); // StreamBuilder
      },
    );
  }
}
