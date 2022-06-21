import 'package:dsvm_app/presentation/themes/theme_color.dart';
import 'package:flutter/material.dart';

class AppTextTheme {
  static const style10pxGrey = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    color: AppColors.grey7,
    fontFamily: 'Nunito',
  );
  static const style12pxGrey = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.grey7,
    fontFamily: 'Nunito',
  );
  static const style12pxGrey6 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.grey7,
    fontFamily: 'Nunito',
  );
  static const style12pxGrey8 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.grey8,
    fontFamily: 'Nunito',
  );
  static const style10pxPrimary = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
    fontFamily: 'Nunito',
  );
  static const normalGrey5 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.grey5,
    fontFamily: 'Nunito',
  );
  static const normalGrey6 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.grey6,
    fontFamily: 'Nunito',
  );
  static const normalGrey = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.grey7,
    fontFamily: 'Nunito',
  );
  static const normalPink = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.pink,
    fontFamily: 'Nunito',
  );
  static const normalGreen = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.green,
    fontFamily: 'Nunito',
  );
  static const normalLink = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.green,
    decoration: TextDecoration.underline,
    fontFamily: 'Nunito',
  );
  static const normalYellow = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.yellow,
    fontFamily: 'Nunito',
  );
  static const normalBlue = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.blue,
    fontFamily: 'Nunito',
  );
  static const normalWhite = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.white,
    fontFamily: 'Nunito',
  );
  static const normalPrimary = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.primaryColor,
    fontFamily: 'Nunito',
  );
  static const normalGrey8 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.grey8,
    fontFamily: 'Nunito',
  );
  static const normalGrey9 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.grey9,
    fontFamily: 'Nunito',
  );

  static const normalThinGrey9 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w300,
    color: AppColors.grey9,
    fontFamily: 'Nunito',
  );
  static const normalBlack = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w400,
    color: AppColors.black,
    fontFamily: 'Nunito',
  );
  static const normalBoldBlack = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.black,
    fontFamily: 'Nunito',
  );
  static const title = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    color: AppColors.grey9,
    fontFamily: 'Nunito',
  );
  static const bigTitle = TextStyle(
    fontSize: 38.0,
    fontWeight: FontWeight.w500,
    color: AppColors.grey9,
    fontFamily: 'Nunito',
  );
  static const medium = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: Colors.white,
    fontFamily: 'Nunito',
  );
  static const mediumGreen = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    color: Colors.green,
    fontFamily: 'Nunito',
  );
  static const medium20PxBlack = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.w500,
    color: AppColors.grey9,
    fontFamily: 'Nunito',
  );
  static const mediumBlack = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.grey9,
    fontFamily: 'Nunito',
  );
  static const mediumBlack14px = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w500,
    color: AppColors.grey9,
    fontFamily: 'Nunito',
  );
  static const mediumPink = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.pink,
    fontFamily: 'Nunito',
  );
  static const mediumPrimary = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    color: AppColors.primaryColor,
    fontFamily: 'Nunito',
  );
  static const smallGrey = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.grey7,
    fontFamily: 'Nunito',
  );
  static const smallBlack = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    color: AppColors.grey9,
    fontFamily: 'Nunito',
  );
  static const smallWhite = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w300,
    color: AppColors.white,
    fontFamily: 'Nunito',
  );
  static const styleDesProduct = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w300,
    height: 1.5,
    wordSpacing: 1,
    fontFamily: 'Nunito',
  );
  static const normal = TextStyle(
    color: Colors.black,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nunito',
  );

  static const normalRed = TextStyle(
    color: Colors.red,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Nunito',
  );

  // Hotfix scale font design, chữ bé hơn 1.3 lần
  static double scaleFont(double input) {
    return input * 1.3;
  }

  static const String font = '';
  static const String nunito = 'Nunito';
}
