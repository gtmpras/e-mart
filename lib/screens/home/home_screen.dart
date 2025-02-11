import 'package:e_mart/shared/cart_icon.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('e-Mart',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.purple),),
          centerTitle: true,
          actions: [CartIcon()],
        ),
        body: GridView.builder(
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              childAspectRatio: 0.9,
            ),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.blueGrey.withOpacity(0.05),
              );
            }));
  }
}
