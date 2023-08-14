import 'package:footwear/data_source/remote_data_source/category_data_source.dart';
import 'package:footwear/model/category_model.dart';
import 'package:footwear/model/product_model.dart';

abstract class CategoryRepository {
  Future<List<Category>?> getAllCategory();
  Future<List<Product>?> getAllCasual();
  Future<List<Product>?> getAllFemaleProduct();
  Future<List<Product>?> getAllMaleProduct();
  Future<List<Product>?> getAllSport();
}

class CategoryRepositoryImp extends CategoryRepository {
  @override
  Future<List<Category>?> getAllCategory() {
    return CategoryRemoteDataSource().getAllCategory();
  }

  @override
  Future<List<Product>?> getAllCasual() {
    return CategoryRemoteDataSource().getAllCasual();
  }

  @override
  Future<List<Product>?> getAllFemaleProduct() {
    return CategoryRemoteDataSource().getAllFemaleProduct();
  }

  @override
  Future<List<Product>?> getAllMaleProduct() {
    return CategoryRemoteDataSource().getAllMaleProduct();
  }

  @override
  Future<List<Product>?> getAllSport() {
    return CategoryRemoteDataSource().getAllSport();
  }
}
