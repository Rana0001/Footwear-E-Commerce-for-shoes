import 'package:footwear/app/constants.dart';
import 'package:footwear/model/add_to_cart.dart';
import 'package:footwear/model/address.dart';
import 'package:footwear/model/category_model.dart';
import 'package:footwear/model/order_model.dart';
import 'package:footwear/model/product_model.dart';
import 'package:footwear/model/transaction.dart';
import 'package:footwear/model/user_model.dart';
import 'package:footwear/objectbox.g.dart';
import 'package:path_provider/path_provider.dart';

class ObjectBoxInstance {
  late final Store _store;
  late final Box<User> _user;
  late final Box<Product> _product;
  late final Box<Category> _category;
  late final Box<UserOrder> _userOrder;
  late final Box<AddToCart> _addToCart;
  late final Box<UserTransaction> _userTransaction;
  late final Box<Address> _address;

  ObjectBoxInstance(this._store) {
    _user = Box<User>(_store);
  }

  static Future<ObjectBoxInstance> init() async {
    var dir = await getApplicationDocumentsDirectory();
    final store = Store(getObjectBoxModel(), directory: '${dir.path}/users');
    return ObjectBoxInstance(store);
  }

  int addUser(User user) {
    return _user.put(user);
  }

  List<User> getAllUser() {
    return _user.getAll();
  }

  bool loginUser(String username, String password) {
    Constant.user = _user
        .query(
            User_.username.equals(username) & User_.password.equals(password))
        .build()
        .findFirst()!;

    return _user
            .query(User_.username.equals(username) &
                User_.password.equals(password))
            .build()
            .findFirst() !=
        null;
  }

  int addProduct(Product product) {
    return _product.put(product);
  }

  addAllProduct(List<Product> products) {
    for (var item in products) {
      if (_product
              .query(Product_.productId.equals(item.productId))
              .build()
              .findFirst() ==
          null) {
        _product.put(item);
      }
    }
  }

  List<Product> getAllProduct() {
    return _product.getAll();
  }

  int addCategory(Category category) {
    return _category.put(category);
  }

  getAllNikeProduct() {
    return _product
        .query(Product_.brand.equals("Nike"))
        .build()
        .find()
        .toList();
  }

  getAllAdidasProduct() {
    return _product
        .query(Product_.brand.equals("Adidas"))
        .build()
        .find()
        .toList();
  }

  getAllJordanProduct() {
    return _product
        .query(Product_.brand.equals("Jordan"))
        .build()
        .find()
        .toList();
  }

  addAllCategory(List<Category> category) {
    for (var item in category) {
      if (_category.query(Category_.id.equals(item.id)).build().findFirst() ==
          null) {
        _category.put(item);
      }
    }
  }

  getAllCategory() {
    return _category.getAll();
  }

  int addOrder(UserOrder order) {
    return _userOrder.put(order);
  }

  List<UserOrder> getAllOrder() {
    return _userOrder.getAll();
  }

  int addAddToCart(AddToCart addToCart) {
    return _addToCart.put(addToCart);
  }

  List<AddToCart> getAllAddToCart() {
    return _addToCart.getAll();
  }

  int addTransaction(UserTransaction transaction) {
    return _userTransaction.put(transaction);
  }

  List<UserTransaction> getAllTransaction() {
    return _userTransaction.getAll();
  }

  int addAddress(Address address) {
    return _address.put(address);
  }

  List<Address> getAllAddress() {
    return _address.getAll();
  }

  void close() {
    _store.close();
  }
}
