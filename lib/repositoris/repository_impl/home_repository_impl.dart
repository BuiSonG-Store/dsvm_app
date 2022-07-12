import 'package:dsvm_app/common/network/client.dart';
import 'package:dsvm_app/data/model/product_model.dart';
import 'package:dsvm_app/repositoris/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final AppClient appClient;

  HomeRepositoryImpl(this.appClient);

  @override
  Future<List<ProductModel>> getDataProducts() async {
    List<ProductModel> result = [];
    final data = await appClient.get('api/Products');
    data['\$values'].forEach((e) {
      ProductModel model = ProductModel.fromJson(e);
      if(result.length == 25){
        return result;
      }
      if(model.product?.$ref == null){
        result.add(model);
      }
    });
    return result;
  }
}
