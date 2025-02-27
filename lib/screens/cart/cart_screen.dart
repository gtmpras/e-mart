
import 'package:e_mart/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
 

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    final total = ref.watch(cartTotalProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart items'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: cartProducts.map((product) {
                return Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: Row(
                    children: [
                      Image.asset(product.image, width: 60, height: 60),
                      const SizedBox(width: 10),
                      Text('${product.title}...',style: TextStyle(fontWeight: FontWeight.bold),),
                      const Expanded(child: SizedBox()),
                      Text('£${product.price}',style: TextStyle(fontWeight: FontWeight.bold),),
                    ]
                  )
                );
              }).toList(), 
            // output cart products
            ),
            Text("Total price: $total",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
            // output totals,
          ],
        ),
      ),
    );
  }
}
