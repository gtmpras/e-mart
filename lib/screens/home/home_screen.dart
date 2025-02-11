import 'package:e_mart/providers/products_provider.dart';
import 'package:e_mart/shared/cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('e-Mart',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.purple),),
          centerTitle: true,
          actions:const [CartIcon()],
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
                  children: [
                    Image.asset(allProducts[index].image, width: 60,height: 60,),
                    const SizedBox(height: 10),
                    Text(allProducts[index].title),
                    const SizedBox(height: 10),
                    Text('\$${allProducts[index].price}'),
                  ],
                ),
              );
            }));
  }
}
