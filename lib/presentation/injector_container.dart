import 'package:dsvm_app/common/global/global_app_cache.dart';
import 'package:dsvm_app/common/local/app_cache.dart';
import 'package:dsvm_app/common/local/local_app.dart';
import 'package:dsvm_app/common/network/client.dart';
import 'package:dsvm_app/presentation/journey/feature/home/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/bloc/loading_bloc/loading_bloc.dart';
import '../common/bloc/snackbar_bloc/snackbar_bloc.dart';
import '../repositoris/repository/home_repository.dart';
import '../repositoris/repository_impl/home_repository_impl.dart';

final injector = GetIt.instance;

Future<void> init(Box box) async {
  _initCommon();
  _initBloc();
  _configureRepositories();
}

void _initBloc() {
  injector.registerLazySingleton(() => LoadingBloc());
  injector.registerLazySingleton(() => SnackBarBloc());
  injector.registerLazySingleton(() => AppCache());

  injector.registerFactory(() => HomeCubit(
    injector()
  ));
}

void _initCommon() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => sharedPreferences);
  injector.registerLazySingleton(() => GlobalAppCache.instance);

  injector.registerLazySingleton(() => LocalApp(injector()));

  injector.registerLazySingleton(() => AppClient(
    injector(),
    injector(),
  ));
}

void _configureRepositories() {
  injector.registerFactory<HomeRepository>(
          () => HomeRepositoryImpl(
        injector()
      ));
}
