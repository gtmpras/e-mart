import 'package:e_mart/providers/cart_provider.dart';
import 'package:e_mart/providers/products_provider.dart';
import 'package:e_mart/shared/cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'e-Mart',
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.purple),
          ),
          centerTitle: true,
          actions: const [CartIcon()],
        ),
        body: GridView.builder(
            itemCount: allProducts.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              final product = allProducts[index];
              final isInCart = cartProducts.contains(product);

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  child: Container(
                    color: Colors.blueGrey.withOpacity(0.05),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            allProducts[index].image,
                            width: 90,
                            height: 80,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(product.title,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                        Text('\$${product.price}',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey)),
                  
                        if (isInCart)
                          TextButton(
                              onPressed: () {
                                ref
                                    .read(cartNotifierProvider.notifier)
                                    .removeProduct(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(
                                        content: Text('${product.title} removed from cart')));
                              },
                              child: const Text(
                                "Remove",
                                style: TextStyle(
                                    color: Colors.red, fontWeight: FontWeight.bold),
                              )),
                        if (!isInCart)
                          TextButton(
                              onPressed: () {
                                ref
                                    .read(cartNotifierProvider.notifier)
                                    .addProduct(product);
                                ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(
                                        content: Text('${product.title} added to cart')));
                              },
                              child: const Text(
                                "Add to cart",
                                style: TextStyle(
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold),
                              ))
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
