import 'package:footwear/data_source/remote_data_source/cart_data_source.dart';
import 'package:footwear/model/add_to_cart.dart';

abstract class CartRepository {
  Future<List<AddToCart>?> getAllCart();
  Future<int> addCart(AddToCart cart);
  Future<int> deleteCart(String id);
  Future<AddToCart> getACart(String id);
  Future<List<AddToCart>?> getUserCart();
}

class CartRepositoryImp extends CartRepository {
  @override
  Future<List<AddToCart>?> getAllCart() async {
    return await CartRemortDataSource().getAllCart();
  }

  @override
  Future<int> addCart(AddToCart cart) {
    return CartRemortDataSource().addCart(cart);
  }

  @override
  Future<int> deleteCart(String id) {
    return CartRemortDataSource().deleteCart(id);
  }

  @override
  Future<AddToCart> getACart(String id) {
    return CartRemortDataSource().getACart(id);
  }

  @override
  Future<List<AddToCart>?> getUserCart() async {
    return await CartRemortDataSource().getUserCart();
  }
}
