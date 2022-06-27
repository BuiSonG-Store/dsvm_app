import 'package:dsvm_app/presentation/journey/screen/container/container.dart';
import 'package:dsvm_app/presentation/journey/screen/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/argument/argument.dart';
import '../common/bloc/loading_bloc/loading_bloc.dart';
import '../common/bloc/loading_bloc/loading_event.dart';
import '../common/navigation/route_names.dart';
import '../common/utils/log_util.dart';
import 'injector_container.dart';
import 'journey/authentication/login/login_screen.dart';
import 'journey/feature/all_product/all_product_screen.dart';
import 'journey/feature/detail_product/detail_product_screen.dart';
import 'journey/feature/detail_product/widget/photo_list_view_screen.dart';
import 'journey/feature/info_personal/infor_personal.dart';
import 'journey/feature/webview/webview_screen.dart';
import 'journey/screen/location_shop.dart';

class Routes {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  factory Routes() => _instance;

  Routes._internal();

  static final Routes _instance = Routes._internal();

  static Routes get instance => _instance;

  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) async {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  Future<dynamic> popAndNavigateTo(
      {dynamic result, String? routeName, dynamic arguments}) {
    return navigatorKey.currentState!
        .popAndPushNamed(routeName ?? '', arguments: arguments);
  }

  Future<dynamic> navigateAndRemove(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState?.pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
      arguments: arguments,
    );
  }

  dynamic popUntil() {
    return navigatorKey.currentState?.popUntil((route) => route.isFirst);
  }

  Future<dynamic> navigateAndReplace(String routeName,
      {dynamic arguments}) async {
    return navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  dynamic pop({dynamic result}) {
    injector<LoadingBloc>().add(FinishLoading());
    return navigatorKey.currentState!.pop(result);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    LOG.d('LOG ROUTE_NAVIGATOR: ${settings.name}');
    switch (settings.name) {
      case RouteName.webViewScreen:
        return CupertinoPageRoute(
          builder: (_) => WebViewScreen(
            argument: settings.arguments != null
                ? settings.arguments as ArgumentWebViewScreen
                : null,
          ),
        );
      case RouteName.splashScreen:
        return CupertinoPageRoute(
          builder: (context) => SplashScreen(),
        );
      case RouteName.containerScreen:
        return CupertinoPageRoute(
          builder: (context) => ContainerScreen(),
        );
      case RouteName.loginScreen:
        return CupertinoPageRoute(
          builder: (context) => LoginScreen(),
        );
      case RouteName.locationShop:
        return CupertinoPageRoute(
          builder: (context) => LocationShop(),
        );
      case RouteName.inforPersonal:
        return CupertinoPageRoute(
          builder: (context) => InforPersonal(),
        );

      case RouteName.allProductScreen:
        return CupertinoPageRoute(
          builder: (context) => AllProductScreen(
            argument: settings.arguments != null
                ? settings.arguments as ArgumentAllProductCommon
                : null,
          ),
        );

      case RouteName.photoListViewerScreen:
        return CupertinoPageRoute(
            builder: (context) => PhotoListViewerScreen(
              argument: settings.arguments != null
                  ? settings.arguments as ArgumentPhotoViewerScreen
                  : null,
            ));

      case RouteName.detailProductScreen:
        return CupertinoPageRoute(
            builder: (context) => DetailProductScreen());

      default:
        return _emptyRoute(settings);
    }
  }

  static MaterialPageRoute _emptyRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        backgroundColor: Colors.green,
        appBar: AppBar(
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: const Center(
              child: Text(
                'Back',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),
        ),
        body: Center(
          child: Text('No path for ${settings.name}'),
        ),
      ),
    );
  }
}
