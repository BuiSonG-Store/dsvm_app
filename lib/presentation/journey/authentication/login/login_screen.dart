import 'package:dsvm_app/common/constants/icon_constant.dart';
import 'package:dsvm_app/common/constants/string_constants.dart';
import 'package:dsvm_app/common/utils/validate_ultils.dart';
import 'package:dsvm_app/presentation/themes/theme_color.dart';
import 'package:dsvm_app/presentation/themes/theme_text.dart';
import 'package:dsvm_app/presentation/widgets/button/button_bottom.dart';
import 'package:dsvm_app/presentation/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import '../../../../common/constants/images_const.dart';
import '../../../widgets/custom_gesturedetector.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passWord = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  void onRegister() {}

  void onForgotPass() {}

  void _onLogin() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: BoxDecoration(
          color: AppColors.green.withOpacity(0.8),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Container(
                  height: MediaQuery.of(context).size.height - 24,
                  width: double.infinity,
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(40)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            ImageConstant.logoNoText,
                            width: 70,
                          ),
                          Spacer(),
                          Text(StringConst.titleDsvm,
                              textAlign: TextAlign.center,
                              style: AppTextTheme.mediumGreen),
                          Spacer()
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Text(
                          StringConst.login,
                          style: AppTextTheme.title,
                        ),
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                          text: 'Nếu bạn chưa có tài khoản, hãy đăng ký ',
                          style: AppTextTheme.normalGrey,
                        ),
                        WidgetSpan(
                          child: CustomGestureDetector(
                            onTap: onRegister,
                            child: Text(
                              'Tại đây!',
                              style: AppTextTheme.normalLink,
                            ),
                          ),
                        ),
                      ])),
                      SizedBox(height: 30),
                      CustomTextField(
                        hintText: StringConst.fillUserName,
                        controller: userNameController,
                        onValidate: ValidateUtils.validEmail,
                        textInputType: TextInputType.emailAddress,
                        maxLine: 1,
                      ),
                      SizedBox(height: 16),
                      CustomTextField(
                          maxLine: 1,
                          hintText: '${StringConst.password}...',
                          controller: passWord,
                          onValidate: ValidateUtils.validatePassword,
                          textInputType: TextInputType.visiblePassword,
                          obscureText: _obscureText,
                          suffixIcon: CustomGestureDetector(
                            onTap: () {
                              setState(() {
                                _obscureText = !_obscureText;
                              });
                            },
                            child: Padding(
                              padding: EdgeInsets.all(12),
                              child: Image.asset(
                                _obscureText ? IconConst.hide : IconConst.show,
                                width: 16,
                                height: 16,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )),
                      Align(
                        alignment: Alignment.centerRight,
                        child: CustomGestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.only(top: 12),
                            child: Text(
                              'Quên mật khẩu!',
                              style: AppTextTheme.normalLink,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      ButtonBottom(
                        color: AppColors.green,
                        paddingHorizontal: 0,
                        text: StringConst.login,
                        haveIcon: false,
                        onTap: _onLogin,
                      ),
                      SizedBox(height: 16),
                      Center(
                        child: Text(
                          'Hoặc đăng nhập với :',
                          style: AppTextTheme.normalGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
