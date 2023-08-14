import 'package:footwear/helper/objectbox.dart';
import 'package:footwear/model/product_model.dart';
import 'package:footwear/state/objectbox_state.dart';

class ProductDataSouce {
  ObjectBoxInstance get _objectBoxInstance => ObjectBoxState.objectBoxInstance!;

  Future<int> addProduct(Product product) async {
    try {
      return _objectBoxInstance.addProduct(product);
    } catch (e) {
      return Future.value(0);
    }
  }

  Future<List<Product>> getAllProduct() async {
    try {
      return Future.value(_objectBoxInstance.getAllProduct());
    } catch (e) {
      throw Exception("Error in getting all Products");
    }
  }

  Future<int> addAllProduct(List<Product> products) async {
    try {
      return _objectBoxInstance.addAllProduct(products);
    } catch (e) {
      return Future.value(0);
    }
  }

  Future<List<Product>> getAllNikeProduct() async {
    try {
      return Future.value(_objectBoxInstance.getAllNikeProduct());
    } catch (e) {
      throw Exception("Error in getting all Nike Products");
    }
  }

  Future<List<Product>> getAllAdidasProduct() async {
    try {
      return Future.value(_objectBoxInstance.getAllAdidasProduct());
    } catch (e) {
      throw Exception("Error in getting all Adidas Products");
    }
  }

  Future<List<Product>> getAllJordanProduct() async {
    try {
      return Future.value(_objectBoxInstance.getAllJordanProduct());
    } catch (e) {
      throw Exception("Error in getting all Jordan Products");
    }
  }
}
