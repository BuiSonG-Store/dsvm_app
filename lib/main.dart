
import 'package:dsvm_app/common/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:dsvm_app/common/bloc/snackbar_bloc/snackbar_state.dart';
import 'package:dsvm_app/common/global/global_app_cache.dart';
import 'package:dsvm_app/presentation/injector_container.dart' as di;
import 'package:dsvm_app/presentation/journey/feature/pop_up/pop_up_layout.dart';
import 'package:dsvm_app/presentation/routes.dart';
import 'package:dsvm_app/presentation/themes/theme_color.dart';
import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

import 'common/bloc/loading_bloc/loading_bloc.dart';
import 'common/constants/app_const.dart';
import 'common/navigation/route_names.dart';
import 'common/utils/common_utils.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDir = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDir.path);
  Box box = await Hive.openBox('box');
  GlobalAppCache.instance.box = box;
  await initInjector();
  runApp(const MyApp());
}

Future initInjector() async {
  if (GlobalAppCache.instance.box != null) {
    await di.init(GlobalAppCache.instance.box!);
  }
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  List<BlocProvider> _getProviders() => [
    BlocProvider<LoadingBloc>(create: (_) => LoadingBloc.instance),
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: _getProviders(), child: ScreenUtilInit(
      designSize:
      const Size(CommonConst.widthDesign, CommonConst.heightDesign),
      builder: (child) => MaterialApp(
        navigatorKey: Routes.instance.navigatorKey,
        onGenerateRoute: Routes.generateRoute,
        initialRoute: RouteName.splashScreen,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            fontFamily: AppTextTheme.nunito,
            canvasColor: Colors.white,
            platform: TargetPlatform.iOS,
            pageTransitionsTheme: const PageTransitionsTheme(builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            })),
        builder: (context, widget) {
          // GScreenUtil.init(context);
          return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: LoadingContainer(
                child: BlocListener<SnackBarBloc, SnackBarState>(
                  bloc: SnackBarBloc.instance,
                  listener: (_, state) {
                    CommonUtil.mapListenerSnackBarState(state);
                  },
                  child: widget ?? const SizedBox(),
                ),
              ));
        },
      ),
    ));
  }
}
