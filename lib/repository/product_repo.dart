import 'dart:io';

import 'package:footwear/app/network_connectivity.dart';
import 'package:footwear/data_source/local_data_source/product_data_source.dart';
import 'package:footwear/data_source/remote_data_source/product_data_source.dart';
import 'package:footwear/model/product_model.dart';

abstract class ProductRepository {
  Future<List<Product>?> getAllProduct();
  Future<int> addProduct(List<File> file, Product product);
  Future<List<Product>?> getAllNikeProduct();
  Future<List<Product>?> getAllAdidasProduct();
  Future<List<Product>?> getAllJordanProduct();
  // Future<List<Product>?> getAllUnknownsProduct();
}

class ProductRepositoryImp extends ProductRepository {
  @override
  Future<List<Product>?> getAllProduct() async {
    var connection = await NetworkConnectivity.isOnline();
    List<Product>? lstProducts;
    if (connection) {
      lstProducts = await ProductRemoteDataSource().getAllProduct();
      await ProductDataSouce().addAllProduct(lstProducts!);

      return lstProducts;
    } else {
      lstProducts = await ProductRemoteDataSource().getAllProduct();

      return lstProducts;
    }
  }

  @override
  Future<int> addProduct(List<File>? file, Product product) async {
    var connection = await NetworkConnectivity.isOnline();
    if (connection) {
      return ProductRemoteDataSource().addProduct(file, product);
    } else {
      return ProductDataSouce().addProduct(product);
    }
  }

  @override
  Future<List<Product>?> getAllAdidasProduct() async {
    var connection = await NetworkConnectivity.isOnline();
    List<Product>? lstProducts;
    if (connection) {
      lstProducts = await ProductRemoteDataSource().getAdidasProduct();

      await ProductDataSouce().addAllProduct(lstProducts!);

      return lstProducts;
    } else {
      return ProductDataSouce().getAllAdidasProduct();
    }
  }

  @override
  Future<List<Product>?> getAllJordanProduct() async {
    var connection = await NetworkConnectivity.isOnline();
    List<Product>? lstProducts;
    if (connection) {
      lstProducts = await ProductRemoteDataSource().getJordanProduct();
      return lstProducts;
    } else {
      return ProductDataSouce().getAllJordanProduct();
    }
  }

  @override
  Future<List<Product>?> getAllNikeProduct() async {
    var connection = await NetworkConnectivity.isOnline();
    List<Product>? lstProducts;
    if (connection) {
      lstProducts = await ProductRemoteDataSource().getNikeProduct();

      return lstProducts;
    } else {
      return ProductDataSouce().getAllNikeProduct();
    }
  }
}
