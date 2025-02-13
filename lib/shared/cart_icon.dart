
import 'package:e_mart/providers/cart_provider.dart';
import 'package:e_mart/screens/cart/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartIcon extends ConsumerWidget {
  const CartIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
final numberOfItems = ref.watch(cartNotifierProvider).length;

    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => const CartScreen(),));
          },
          icon: const Icon(Icons.shopping_cart,size: 35,color: Colors.green,),
        ),
        Positioned(
          top: 5,
          child: Container(
            width: 18,
            height: 18,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(numberOfItems.toString(),style: const TextStyle(fontSize: 12,color: Colors.white, fontWeight: FontWeight.bold),),
           
          ),
        ),
      ],
    );
  }
}