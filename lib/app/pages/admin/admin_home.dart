import 'package:ecommerce/app/pages/admin/lib/pages/admin_add_product.dart';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utils/snackbars.dart';
import 'package:ecommerce/widgets/project_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ecommerce/app/pages/providers.dart';
import 'package:lottie/lottie.dart';

class AdminHome extends ConsumerWidget {
  const AdminHome({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Home'),
        actions: [
          IconButton(
            onPressed: () => ref.read(firebaseAuthProvider).signOut(),
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const AdminAddProductPage(),
          ),
        ),
      ),
      body: StreamBuilder<List<Product>>(
        stream: ref.read(databaseProvider)!.getProducts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active &&
              snapshot.data != null) {
            if (snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text("No products yet..."),
                    Lottie.asset("assets/anim/empty.json", // here
                        width: 200,
                        repeat: false),
                  ],
                ),
              );
            }

            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final product = snapshot.data![index];
                return ProductListTile(
                    product: product,
                    onDelete: () async {
                      openIconSnackBar(
                        context,
                        "Deleting item...",
                        const Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      );
                      await ref
                          .read(databaseProvider)!
                          .deleteProduct(product.id!);
                    });
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
