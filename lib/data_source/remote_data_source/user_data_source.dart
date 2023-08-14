import 'dart:io';

import 'package:dio/dio.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/data_source/remote_data_source/response/user_data_response.dart';
import 'package:footwear/helper/http_services.dart';
import 'package:footwear/model/user_model.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class UserRemoteDataSource {
  final Dio _httpServices = HttpServices().getDioInstance();

  Future<int> registerUser(File? file, User user) async {
    try {
      MultipartFile? image;
      if (file != null) {
        var mimeType = lookupMimeType(file.path);
        image = await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last,
            contentType: MediaType('image', mimeType!.split('/').last));
      }
      FormData formData = FormData.fromMap({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'username': user.username,
        'password': user.password,
        'phoneNumber': user.phoneNumber,
        'email': user.email,
        'role': user.role,
        'profileURL':
            file != null ? await MultipartFile.fromFile(file.path) : "",
      });
      final response = await _httpServices.post(
        Constant.registerUrl,
        data: formData,
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

  Future<bool> loginUser(String username, String password) async {
    try {
      Response response = await _httpServices.post(
        Constant.loginUrl,
        data: {
          'username': username,
          'password': password,
        },
      );
      if (response.statusCode == 200) {
        Constant.user = User.fromJson(response.data["data"]);

        Constant.token = "Bearer ${response.data['token']}";
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  Future<List<User>> getAllUser() async {
    try {
      Response response = await _httpServices.get(
        Constant.userUrl,
        options: Options(
          headers: {
            'Authorization': Constant.token,
          },
        ),
      );
      if (response.statusCode == 200) {
        return (response.data as List).map((e) => User.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<User> getUserById(String id) async {
    try {
      Response response = await _httpServices.get(
        "${Constant.userUrl}/$id",
        options: Options(
          headers: {
            'Authorization': Constant.token,
          },
        ),
      );
      if (response.statusCode == 200) {
        UserDataResponse userDataResponse =
            UserDataResponse.fromJson(response.data);
        Constant.user = userDataResponse.data!;
        return userDataResponse.data!;
      } else {
        return User();
      }
    } catch (e) {
      return User();
    }
  }

  Future<int> updateProfile(File? file, User user) async {
    print(user.firstName);
    try {
      MultipartFile? image;
      if (file != null) {
        var mimeType = lookupMimeType(file.path);
        image = await MultipartFile.fromFile(file.path,
            filename: file.path.split('/').last,
            contentType: MediaType('image', mimeType!.split('/').last));
      }

      FormData formData = FormData.fromMap({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'password': user.password,
        'phoneNumber': user.phoneNumber,
        'profileURL': file != null ? image! : "",
      });
      final response = await _httpServices.put(
        "${Constant.userUrl}/${Constant.user.uid!}",
        options: Options(
          headers: {
            'Authorization': Constant.token,
          },
        ),
        data: formData,
      );
      if (response.statusCode == 201) {
        Constant.user = User.fromJson(response.data["data"]);
        return 1;
      } else {
        return 0;
      }
    } catch (e) {
      print(e.toString());
      return 0;
    }
  }
}
