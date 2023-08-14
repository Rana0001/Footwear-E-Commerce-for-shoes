import 'package:footwear/data_source/remote_data_source/order_data_source.dart';
import 'package:footwear/model/order_model.dart';

abstract class OrderRepository {
  Future<List<UserOrder>?> getAllOrder();
  Future<int> addOrder(UserOrder order);
  Future<int> deleteOrder(String id);
  Future<UserOrder> getAOrder(String id);
}

class OrderRepositoryImp extends OrderRepository {
  @override
  Future<List<UserOrder>?> getAllOrder() {
    return OrderRemoteDataSource().getAllOrders();
  }

  @override
  Future<int> addOrder(UserOrder order) {
    return OrderRemoteDataSource().addOrder(order);
  }

  @override
  Future<int> deleteOrder(String id) {
    return OrderRemoteDataSource().deleteOrder(id);
  }

  @override
  Future<UserOrder> getAOrder(String id) {
    return OrderRemoteDataSource().getAOrder(id);
  }
}