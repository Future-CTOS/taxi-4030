import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:taxi_4030/src/infrastructures/routes/route_names.dart';
import '../../shared/dialogs/retry_dialog.dart';
import '../repositories/splash_screen_page_repository.dart';

class SplashScreenPageController extends GetxController {
  @override
  void onInit() {
    WidgetsBinding.instance.addPostFrameCallback(
      (final _) => _checkConnection(),
    );
    super.onInit();
  }

  final RxBool hasConnectionError = false.obs;
  final RxBool showRetryButton = false.obs;
  final _repository = SplashScreenPageRepository();
  RxBool isLoading = false.obs;

  Future<bool> _checkConnection() async {
    await Future<void>.delayed(3000.milliseconds);
    Get.offAllNamed(TaxiRouteNames.phoneInput.uri);
    // final Either<String, bool> result = await _repository.checkConnection();
    //
    // result.fold(
    //   (exception) {
    //     _onConnectionError(exception);
    //     return false;
    //   },
    //   (right) {
    //     Get.toNamed(TaxiRouteNames.phoneInput.uri);
    //     return true;
    //   },
    // );

    return true;
  }

  Future<void> _onConnectionError(final String exception) async {
    showRetryButton.value = true;
    RetryDialog(
      errorMessage: exception,
      onRetryTapped: () => _onRetryTapped(),
    ).show(Get.context!);
  }

  Future<void> _onRetryTapped() async {
    showRetryButton.value = false;
  }
}
