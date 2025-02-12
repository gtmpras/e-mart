import 'package:e_mart/models/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

List<ProductModel> allProducts = const[
  ProductModel(
    id: '1',
    title: 'Groovy Shorts',
    price: 35,
    image: 'assets/products/shorts.png',
  ),
  ProductModel(
    id: '2',
    title: 'Karati kit',
    price: 25,
    image: 'assets/products/karati.png',
  ),
  ProductModel(
    id: '3',
    title: 'Denim Jeans',
    price: 60,
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
    price: 120,
    image: 'assets/products/drum.png',
  ),
  ProductModel(
    id: '6',
    title: 'Blue Suitcase',
    price: 200,
    image: 'assets/products/suitcase.png',
  ),
  ProductModel(
    id: '7',
    title: 'Roller Skates',
    price: 150,
    image: 'assets/products/skates.png',
  ),
  ProductModel(
    id: '8',
    title: 'Eletric Guitar',
    price: 600,
    image: 'assets/products/guitar.png',
  ),
];

// final productsProvider = Provider((ref) => allProducts);

// final reducedProductProvider = Provider((ref) {
//   return allProducts.where((p) => p.price < 50).toList();
// });

//generated provider
@riverpod
List<ProductModel> products(ref){
  return allProducts;

}

@riverpod
List<ProductModel> reducedProduct(ref){
  return allProducts.where((p) => p.price < 50).toList();
}