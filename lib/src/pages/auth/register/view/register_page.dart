import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../components/scaffold.dart';
import '../../../../infrastructures/utils/spacing.dart';
import '../../../shared/widgets/page_bottom_button.dart';
import '../controller/register_controller.dart';
import 'widgets/register_form.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(body: _body(context));

  Widget _body(BuildContext context) => Padding(
    padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 32),
    child: Column(
      children: [
        Expanded(flex: 1, child: _headerContent(context)),
        Expanded(flex: 2, child: _inputMobileNumber(context)),
        Obx(
          () => PageBottomButton(
            label: 'ادامه',
            onTap: controller.isFormFilled.value
                ? controller.submitUserInfo
                : () {},
            isActive: controller.isFormFilled.value,
            isLoading: controller.isLoading.value,
          ),
        ),
      ],
    ),
  );

  Widget _headerContent(BuildContext context) => Column(
    children: [
      Text('ثبت نام', style: Theme.of(context).textTheme.titleLarge),
      AppSpacing.largeVerticalSpacer,
      Text(
        'اطلاعات خواسته شده را به فارسی وارد کنید',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    ],
  );

  Widget _inputMobileNumber(BuildContext context) => RegisterForm();
}
