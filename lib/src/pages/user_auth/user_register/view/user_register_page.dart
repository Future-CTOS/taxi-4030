import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/scaffold.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../controller/user_register_controller.dart';
import 'widgets/register_form.dart';

class UserRegisterPage extends GetView<UserRegisterController> {
  const UserRegisterPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'ثبت نام',
    bodySubTitle: 'اطلاعات خواسته شده را به فارسی وارد کنید',
    bottomSheet: Obx(
      () => PageBottomButton(
        label: 'ادامه',
        onTap: controller.isFormFilled.value
            ? controller.submitUserInfo
            : () {},
        isActive: controller.isFormFilled.value,
        isLoading: controller.isLoading.value,
      ),
    ),
    body: _body(context),
  );

  Widget _body(BuildContext context) =>
      Column(children: [Expanded(flex: 2, child: _inputMobileNumber(context))]);

  Widget _inputMobileNumber(BuildContext context) => RegisterForm();
}
