import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/data_source/remote_data_source/response/cart_data_response.dart';
import 'package:footwear/data_source/remote_data_source/response/get_cart_response.dart';
import 'package:footwear/helper/http_services.dart';
import 'package:footwear/model/add_to_cart.dart';

class CartRemortDataSource {
  final Dio _httpServices = HttpServices().getDioInstance();

  Future<List<AddToCart>> getAllCart() async {
    Response response = await _httpServices.get(
      Constant.cartUrl,
      options: Options(
        headers: {
          'Authorization': Constant.token,
        },
      ),
    );
    if (response.statusCode == 200) {
      CartResponse cartResponse = CartResponse.fromJson(response.data);

      return cartResponse.data!.toList();
    } else {
      return [];
    }
  }

  Future<int> addCart(AddToCart cart) async {
    try {
      Response response = await _httpServices.post(
        Constant.cartUrl,
        data: {
          'product': cart.product,
          'quantity': cart.quantity,
          'total': cart.total,
          'status': cart.status,
          'user': cart.user,
        },
        options: Options(
          headers: {
            'Authorization': Constant.token,
          },
        ),
      );
      if (response.statusCode == 200) {
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  Future<int> deleteCart(String id) async {
    try {
      Response response = await _httpServices.delete(
        '${Constant.cartUrl}/$id',
        options: Options(
          headers: {
            'Authorization': Constant.token,
          },
        ),
      );
      if (response.statusCode == 201) {
        return 1;
      } else {
        return 1;
      }
    } catch (e) {
      return 1;
    }
  }

  Future<AddToCart> getACart(String id) async {
    Response response = await _httpServices.get(
      '${Constant.cartUrl}/$id',
      options: Options(
        headers: {
          'Authorization': Constant.token,
        },
      ),
    );
    if (response.statusCode == 200) {
      CartDataResponse cartDataResponse =
          CartDataResponse.fromJson(response.data);

      return cartDataResponse.data!;
    } else {
      return AddToCart();
    }
  }

  Future<List<AddToCart>?> getUserCart() async {
    try {
      Response response = await _httpServices.get(
        '${CartUrl.cartUrl}/${Constant.user.uid}',
        options: Options(
          headers: {
            'Authorization': Constant.token,
          },
        ),
      );
      if (response.statusCode == 200) {
        CartResponse cartResponse = CartResponse.fromJson(response.data);
        return cartResponse.data!.toList();
      } else {
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }
}
