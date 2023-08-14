import 'package:dio/dio.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/data_source/remote_data_source/response/get_order_response.dart';
import 'package:footwear/data_source/remote_data_source/response/order_response.dart';
import 'package:footwear/helper/http_services.dart';
import 'package:footwear/model/order_model.dart';

class OrderRemoteDataSource {
  final Dio _httpServices = HttpServices().getDioInstance();

  Future<List<UserOrder>> getAllOrders() async {
    Response response = await _httpServices.get(
      Constant.orderUrl,
      options: Options(
        headers: {
          'Authorization': Constant.token,
        },
      ),
    );
    if (response.statusCode == 200) {
      OrderResponse orderDataResponse = OrderResponse.fromJson(response.data);

      return orderDataResponse.data!.toList();
    } else {
      return [];
    }
  }

  Future<int> addOrder(UserOrder order) async {
    try {
      Response response = await _httpServices.post(
        Constant.orderUrl,
        data: {
          'productId': order.product,
          'quantity': order.quantity,
          'total': order.total,
          'status': order.status,
          'user': order.user,
          'color': order.color
        },
        options: Options(
          headers: {
            'Authorization': Constant.token,
          },
        ),
      );
      if (response.statusCode == 201) {
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }

  Future<int> deleteOrder(String id) async {
    try {
      Response response = await _httpServices.delete(
        '${Constant.orderUrl}/$id',
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

  Future<UserOrder> getAOrder(String id) async {
    try {
      Response response = await _httpServices.get(
        '${Constant.orderUrl}/$id',
        options: Options(
          headers: {
            'Authorization': Constant.token,
          },
        ),
      );
      if (response.statusCode == 200) {
        OrderDataResponse orderDataResponse =
            OrderDataResponse.fromJson(response.data);
        return orderDataResponse.data!;
      } else {
        return UserOrder();
      }
    } catch (e) {
      return UserOrder();
    }
  }
}
