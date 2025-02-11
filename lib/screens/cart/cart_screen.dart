
import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool showCoupon = true;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Your cart items"),
      ),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
              children: [
                
              ],
            )
          ],
        ),
      ),
    );
  }
}