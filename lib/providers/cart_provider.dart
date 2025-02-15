
import 'package:e_mart/models/product_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_provider.g.dart';

class CartNotifier extends Notifier<Set<ProductModel>>{
  //initial value
  @override
  Set<ProductModel>build(){
    return const{
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

@riverpod
int cartTotal(ref){
  final cartProducts = ref.watch(cartNotifierProvider);
  int total = 0;
  for (ProductModel product in cartProducts){
    total += product.price;
  }
  return total;
}