import 'package:dio/dio.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/data_source/remote_data_source/response/get_category_response.dart';
import 'package:footwear/data_source/remote_data_source/response/get_product_response.dart';
import 'package:footwear/helper/http_services.dart';
import 'package:footwear/model/category_model.dart';
import 'package:footwear/model/product_model.dart';

class CategoryRemoteDataSource {
  final Dio _httpServices = HttpServices().getDioInstance();
  Future<List<Category>> getAllCategory() async {
    try {
      Response response = await _httpServices.get(
        Constant.categoryUrl,
        options: Options(
          headers: {
            'Authorization': Constant.token,
          },
        ),
      );
      if (response.statusCode == 200) {
        CategoryResponse categoryResponse =
            CategoryResponse.fromJson(response.data);

        return categoryResponse.data!.toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Product>> getAllCasual() async {
    try {
      Response response = await _httpServices.get(
        CategoryUrl.casualCategoryUrl,
        options: Options(
          headers: {
            'Authorization': Constant.token,
          },
        ),
      );
      if (response.statusCode == 200) {
        ProductResponse productResponse =
            ProductResponse.fromJson(response.data);
        return productResponse.data!.toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Product>> getAllSport() async {
    try {
      Response response = await _httpServices.get(
        CategoryUrl.sportCategoryUrl,
        options: Options(
          headers: {
            'Authorization': Constant.token,
          },
        ),
      );
      if (response.statusCode == 200) {
        ProductResponse productResponse =
            ProductResponse.fromJson(response.data);
        return productResponse.data!.toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Product>> getAllFemaleProduct() async {
    try {
      Response response = await _httpServices.get(
        CategoryUrl.femaleProductUrl,
        options: Options(
          headers: {
            'Authorization': Constant.token,
          },
        ),
      );
      if (response.statusCode == 200) {
        ProductResponse productResponse =
            ProductResponse.fromJson(response.data);
        return productResponse.data!.toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<List<Product>> getAllMaleProduct() async {
    try {
      Response response = await _httpServices.get(
        CategoryUrl.maleProductUrl,
        options: Options(
          headers: {
            'Authorization': Constant.token,
          },
        ),
      );
      if (response.statusCode == 200) {
        ProductResponse productResponse =
            ProductResponse.fromJson(response.data);
        return productResponse.data!.toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
