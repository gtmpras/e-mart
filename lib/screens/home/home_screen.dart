import 'package:e_mart/providers/card_provider.dart';
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
              return Container(
                color: Colors.blueGrey.withOpacity(0.05),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      allProducts[index].image,
                      width: 90,
                      height: 80,
                    ),
                    Text(allProducts[index].title),
                    Text('\$${allProducts[index].price}'),
                    if (cartProducts.contains(allProducts[index]))
                      TextButton(
                          onPressed: () {
                            ref
                                .read(cartNotifierProvider.notifier)
                                .removeProduct(allProducts[index]);
                          },
                          child:const Text(
                            "Remove",
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.bold),
                          )),
                    if (!cartProducts.contains(allProducts[index]))
                      TextButton(
                          onPressed: () {
                            ref
                                .read(cartNotifierProvider.notifier)
                                .addProduct(allProducts[index]);
                          },
                          child: Text(
                            "Add to cart",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.bold),
                          ))
                  ],
                ),
              );
            }));
  }
}
