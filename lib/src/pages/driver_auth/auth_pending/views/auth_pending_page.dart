import 'package:flutter/material.dart';
import 'package:taxi_4030/src/components/scaffold.dart';

import '../../shared/auth_pending_view.dart';

class AuthPendingPage extends StatelessWidget {
  const AuthPendingPage({super.key});

  @override
  Widget build(BuildContext context) => CustomScaffold(
    bodyTitle: 'در حال برسی احراز هویت',
    bodySubTitle: 'ویدیوی شما با موفقیت ارسال شد.',
    body: AuthPendingView(),
  );
}
