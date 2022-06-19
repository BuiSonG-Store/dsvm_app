import 'package:get_it/get_it.dart';

import '../common/bloc/loading_bloc/loading_bloc.dart';

final injector = GetIt.instance;

Future<void> init() async {
  _configureRepositories();
  _initBloc();
}

void _initBloc() {
  injector.registerLazySingleton(() => LoadingBloc());
}

void _configureRepositories() {}
