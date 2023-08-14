import 'package:footwear/model/add_to_cart.dart';
import 'package:footwear/model/product_model.dart';
import 'package:footwear/model/user_model.dart';

class Constant {
  // static const String baseURL = "http://10.0.2.2:3000/";
  // static const String baseURL = "http://localhost:3000/";

  static const String baseURL = "http://192.168.101.3:3000/";
  // static const String baseURL = "http://192.168.254.94:3000/";
  // static const String baseURL = "http://192.168.137.172:3000/";

  static const String userUrl = "user/";
  static const String loginUrl = "login";
  static const String registerUrl = "register";

  static const String categoryUrl = "category/";

  static const String productUrl = "product/";

  static const String jordanProduct = "product/jordan";

  static const String nikeProduct = "product/nike";

  static const String adidasProduct = "product/adidas";

  // static const String userImageUrl = "http://10.0.2.2:3000";
  static const String userImageUrl = "http://192.168.101.3:3000";
  // static const String userImageUrl = "http://192.168.254.94:3000";
  // static const String userImageUrl = "http://192.168.137.172:3000";

  static String token = "";

  static const String orderUrl = "order/";

  static const String profilePicture = "user/profile";

  static const String cartUrl = "cart/";

  static User user = User();

  static Product product = Product();

  static List<AddToCart>? cart = [];
  static int cartLength = 0;
}

class CartUrl {
  static const String cartUrl = "cart/user";
}

class CategoryUrl {
  static const String sportCategoryUrl = "category/sport";

  static const String casualCategoryUrl = "category/casual";

  static const String maleProductUrl = "category/male";

  static const String femaleProductUrl = "category/female";

  static List indexList = [];
}
