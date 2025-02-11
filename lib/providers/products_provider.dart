import 'package:e_mart/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ProductModel> allProducts = [
  ProductModel(
    id: '1',
    title: 'Groovy Shorts',
    price: 100,
    image: 'assets/products/shorts.png',
  ),
  ProductModel(
    id: '2',
    title: 'Karati kit',
    price: 100,
    image: 'assets/products/karati.png',
  ),
  ProductModel(
    id: '3',
    title: 'Denim Jeans',
    price: 100,
    image: 'assets/products/jeans.png',
  ),
  ProductModel(
    id: '4',
    title: 'Red Bagpack',
    price: 100,
    image: 'assets/products/bagpack.png',
  ),
  ProductModel(
    id: '5',
    title: 'Drum & Sticks',
    price: 100,
    image: 'assets/products/drum.png',
  ),
  ProductModel(
    id: '6',
    title: 'Blue Suitcase',
    price: 100,
    image: 'assets/products/suitcase.png',
  ),
  ProductModel(
    id: '7',
    title: 'Roller Skates',
    price: 100,
    image: 'assets/products/skates.png',
  ),
  ProductModel(
    id: '8',
    title: 'Eletric Guitar',
    price: 100,
    image: 'assets/products/guitar.png',
  ),
];

final productsProvider = Provider((ref) => allProducts);

final reducedProductProvider = Provider((ref) {
  return allProducts.where((product) => product.price < 50).toList();
});