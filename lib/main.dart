import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:dsvm_app/presentation/journey/authentication/login/login_screen.dart';
import 'package:dsvm_app/presentation/journey/feature/home/home_screen.dart';
import 'package:dsvm_app/presentation/journey/screen/container/container.dart';
import 'package:dsvm_app/presentation/journey/screen/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: SplashScreen(),
        splashIconSize: double.maxFinite,
        centered: true,
        nextScreen: ContainerScreen(),
      ),
    );
  }
}
