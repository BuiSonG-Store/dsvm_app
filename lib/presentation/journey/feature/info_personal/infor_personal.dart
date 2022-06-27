import 'package:dsvm_app/common/utils/validate_ultils.dart';
import 'package:dsvm_app/presentation/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';

import '../../../../common/constants/string_constants.dart';
import '../../../widgets/custom_scaffold.dart';
import '../../../widgets/text_field/custom_textfield_with_label_inside.dart';

class InforPersonal extends StatefulWidget {
  const InforPersonal({Key? key}) : super(key: key);

  @override
  State<InforPersonal> createState() => _InforPersonalState();
}

class _InforPersonalState extends State<InforPersonal> {
  TextEditingController gmailController = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      customAppBar: CustomAppBar(
        title: 'Sửa thông tin',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              CustomTextFieldWithLabelInside(
                hintText: 'Gmail của bạn',
                controller: gmailController,
                validator: ValidateUtils.validEmail,
                textInputType: TextInputType.emailAddress,
                maxLine: 1,
              ),
              SizedBox(height: 12),
              CustomTextFieldWithLabelInside(
                hintText: 'Tên của bạn',
                controller: name,
                textInputType: TextInputType.emailAddress,
                maxLine: 1,
              ),
              SizedBox(height: 12),
              CustomTextFieldWithLabelInside(
                hintText: 'Số điện thoại',
                controller: phoneNumber,
                validator: ValidateUtils.isValidPhoneNumber,
                textInputType: TextInputType.phone,
                maxLine: 1,
              ),
              SizedBox(height: 12),
            ],
          ),
        ),
      ),
    );
  }
}
