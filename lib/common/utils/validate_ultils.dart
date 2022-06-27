class ValidateUtils {
  static String? validEmail(String? input) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = RegExp(p);
    if (regExp.hasMatch(input!)) {
      return null;
    }
    return 'Email không hợp lệ';
  }

  static String? validatePassword(String? value) {
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value!.isEmpty) {
      return 'Vui lòng nhập mật khẩu';
    } else {
      if (!regex.hasMatch(value)) {
        return 'Vui lòng nhập mật khẩu';
      } else {
        return null;
      }
    }
  }

  static String? isValidPhoneNumber(String? string) {
    if (string == null || string.isEmpty) {
      return 'Vui lòng nhập số điện thoại!';
    }

    const pattern = r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$';
    final regExp = RegExp(pattern);

    if (!regExp.hasMatch(string)) {
      return 'Vui lòng nhập đúng số điện thoại!';
    }
  }
}
