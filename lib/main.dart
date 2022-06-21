import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dsvm_app/common/bloc/snackbar_bloc/snackbar_bloc.dart';
import 'package:dsvm_app/common/bloc/snackbar_bloc/snackbar_state.dart';
import 'package:dsvm_app/common/utils/screen_utils.dart';
import 'package:dsvm_app/presentation/journey/authentication/login/login_screen.dart';
import 'package:dsvm_app/presentation/journey/feature/home/home_screen.dart';
import 'package:dsvm_app/presentation/journey/feature/pop_up/pop_up_layout.dart';
import 'package:dsvm_app/presentation/journey/screen/container/container.dart';
import 'package:dsvm_app/presentation/journey/screen/splash_screen.dart';
import 'package:dsvm_app/presentation/routes.dart';
import 'package:dsvm_app/presentation/themes/theme_color.dart';
import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'common/bloc/loading_bloc/loading_bloc.dart';
import 'common/constants/app_const.dart';
import 'common/navigation/route_names.dart';
import 'common/utils/common_utils.dart';

void main() {
  runApp(const MyApp());
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
