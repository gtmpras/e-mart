
import 'package:e_mart/models/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CartNotifier extends Notifier<Set<ProductModel>>{
  //initial value
  @override
  Set<ProductModel>build(){
    return const{
      ProductModel(
        id: '1',
        title: 'Groovy Shorts',
        price: 35,
        image: 'assets/products/shorts.png',
      ),  
    };
  }

  //methods to update state
  void addProduct(ProductModel product){
    state = {...state, product};
  }

  void removeProduct(ProductModel product){
    state = state.where((p)=> p.id != product.id).toSet();
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<ProductModel>>(() => CartNotifier());