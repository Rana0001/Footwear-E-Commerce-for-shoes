import 'dart:io';

import 'package:footwear/app/network_connectivity.dart';
import 'package:footwear/data_source/local_data_source/user_data_source.dart';
import 'package:footwear/data_source/remote_data_source/user_data_source.dart';
import 'package:footwear/helper/objectbox.dart';
import 'package:footwear/model/user_model.dart';
import 'package:footwear/state/objectbox_state.dart';

abstract class UserRepository {
  Future<List<User>> getAllUser();
  Future<int> registerUser(File? file, User user);
  Future<bool> login(String username, String password);
  Future<int> updateUser(File? file, User user);
}

class UserRepositoryImp extends UserRepository {
  final ObjectBoxInstance _objectBoxInstance =
      ObjectBoxState.objectBoxInstance!;
  @override
  Future<List<User>> getAllUser() async {
    var connection = await NetworkConnectivity.isOnline();
    if (connection) {
      return UserRemoteDataSource().getAllUser();
    } else {
      return UserDataSource().getUser();
    }
  }

  @override
  Future<bool> login(String username, String password) async {
    var connection = await NetworkConnectivity.isOnline();
    if (connection) {
      return UserRemoteDataSource().loginUser(username, password);
    } else {
      return UserDataSource().login(username, password);
    }
  }

  @override
  Future<int> registerUser(File? file, User user) async {
    var connection = await NetworkConnectivity.isOnline();
    if (connection) {
      return UserRemoteDataSource().registerUser(file, user);
    } else {
      return 0;
    }
  }

  @override
  Future<int> updateUser(File? file, User user) async {
    var connection = await NetworkConnectivity.isOnline();
    if (connection) {
      return UserRemoteDataSource().updateProfile(file, user);
    } else {
      return 0;
    }
  }
}
