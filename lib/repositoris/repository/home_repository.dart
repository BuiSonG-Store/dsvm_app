import '../../data/model/product_model.dart';

abstract class HomeRepository{
  Future<List<ProductModel>> getDataProducts();
}