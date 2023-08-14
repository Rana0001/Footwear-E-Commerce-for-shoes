import 'dart:io';

import 'package:dio/dio.dart';
import 'package:footwear/app/constants.dart';
import 'package:footwear/data_source/remote_data_source/response/get_product_response.dart';
import 'package:footwear/helper/http_services.dart';
import 'package:footwear/model/product_model.dart';
import 'package:mime/mime.dart';
import 'package:http_parser/http_parser.dart';

class ProductRemoteDataSource {
  final Dio _httpServices = HttpServices().getDioInstance();

  Future<List<Product>?> getAllProduct() async {
    try {
      Response response = await _httpServices.get(
        Constant.productUrl,
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
      print(e.toString());
      return [];
    }
  }

Future<List<Product>> allFemale() async{
  try{
    Response response = await _httpServices.get(
      CategoryUrl.femaleProductUrl,
      options: Options(
        headers: {
          'Authorization': Constant.token,
        },
      ),
    );
    if(response.statusCode == 200){
      ProductResponse productResponse = ProductResponse.fromJson(response.data);
      return productResponse.data!.toList();
    }
    else{
      return [];
    }
  }
  catch(e){
    return [];
  }
  catch(e){
    return [];
  }
}

  Future<int> addProduct(List<File>? file, Product product) async {
    try {
      List<MultipartFile>? image;
      if (file != null) {
        for (var i = 0; i < file.length; i++) {
          var mimeType = lookupMimeType(file[i].path);
          var multipartFile = await MultipartFile.fromFile(file[i].path,
              filename: file[i].path.split('/').last,
              contentType: MediaType('image', mimeType!.split('/').last));
          image!.add(multipartFile);
        }
      }
      FormData formData = FormData.fromMap({
        'title': product.title,
        'price': product.price,
        'size': product.size,
        'color': product.color,
        'item': product.items,
        'images': file != null ? image : "",
      });
      Response response = await _httpServices.post(
        Constant.productUrl,
        data: file,
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

  Future getProductById(int id) async {
    try {
      Response response = await _httpServices.get(
        "${Constant.productUrl}/$id",
        options: Options(
          headers: {
            'Authorization': Constant.token,
          },
        ),
      );
      if (response.statusCode == 200) {
        return Product.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<Product>> getNikeProduct() async {
    try {
      Response response = await _httpServices.get(
        Constant.nikeProduct,
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

  Future<List<Product>?> getAdidasProduct() async {
    try {
      Response response = await _httpServices.get(
        Constant.adidasProduct,
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

  Future<List<Product>?> getJordanProduct() async {
    try {
      Response response = await _httpServices.get(
        Constant.jordanProduct,
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
