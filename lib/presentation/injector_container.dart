import 'package:dsvm_app/common/local/app_cache.dart';
import 'package:dsvm_app/common/local/local_app.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/bloc/loading_bloc/loading_bloc.dart';
import '../common/bloc/snackbar_bloc/snackbar_bloc.dart';

final injector = GetIt.instance;

Future<void> init(Box box) async {
  _initCommon();
  _initBloc();
}

void _initBloc() {
  injector.registerLazySingleton(() => LoadingBloc());
  injector.registerLazySingleton(() => SnackBarBloc());
  injector.registerLazySingleton(() => AppCache());
}

void _initCommon() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  injector.registerLazySingleton(() => sharedPreferences);

  injector.registerLazySingleton(() => LocalApp(injector()));
}
