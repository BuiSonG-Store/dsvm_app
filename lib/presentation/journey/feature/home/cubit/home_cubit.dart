import 'package:dsvm_app/data/model/product_model.dart';
import 'package:dsvm_app/presentation/journey/feature/home/cubit/home_states.dart';
import 'package:dsvm_app/repositoris/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeRepository homeRepository;
  HomeCubit(this.homeRepository) : super(HomeInitState());

  void getDataHomeCenter()async{
    List<ProductModel> listProductNew =[];
    List<ProductModel> listProductHot =[];
    try{
      emit(HomeGettingDataState());
      var data = await homeRepository.getDataProducts();
      if(data.isNotEmpty && data.length >=24){
        for(int i =0; i< 12; i++){
          listProductNew.add(data[i]);
        }

        for(int i =12; i< 24; i++){
          listProductHot.add(data[i]);
        }
      }

      emit(HomeGotDataState(listProductHot, listProductNew));
    } catch(e){
      emit(HomeGetDataFailState());
    }
  }

}