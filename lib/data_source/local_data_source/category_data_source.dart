import 'package:footwear/helper/objectbox.dart';
import 'package:footwear/model/category_model.dart';
import 'package:footwear/state/objectbox_state.dart';

class CategoryDataSource {
  ObjectBoxInstance get _objectBoxInstance => ObjectBoxState.objectBoxInstance!;

  Future<int> addCategory(Category category) async {
    try {
      return _objectBoxInstance.addCategory(category);
    } catch (e) {
      return Future.value(0);
    }
  }

  Future<List<Category>> getAllCategory() async {
    try {
      return Future.value(_objectBoxInstance.getAllCategory());
    } catch (e) {
      throw Exception("Error in getting all Categories");
    }
  }

  Future<int> addAllCategory(List<Category> categories) async {
    try {
      return _objectBoxInstance.addAllCategory(categories);
    } catch (e) {
      return Future.value(0);
    }
  }
}
