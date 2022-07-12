import 'package:dsvm_app/data/model/product_model.dart';

abstract class HomeState{}

class HomeInitState extends HomeState{}

class HomeGettingDataState extends HomeState{}

class HomeGotDataState extends HomeState{
  final List<ProductModel> productNews;
  final List<ProductModel> productHots;
  HomeGotDataState(this.productNews, this.productHots);
}

class HomeGetDataFailState extends HomeState{}