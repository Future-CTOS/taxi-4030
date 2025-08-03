import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:taxi_4030/src/pages/shared/model/enum/status_enum.dart';
import '../../../../components/telegram_style_camera.dart';
import '../../../../infrastructures/routes/route_names.dart';
import '../../../../infrastructures/utils/utils.dart';

class VanUploadInsuranceInformationController extends GetxController {
  final RxBool isActiveContinue = false.obs;
  final RxBool isLoading = false.obs;
  late final CameraController? cameraController;
  late final List<CameraDescription>? cameras;

  Future<void> _initCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(cameras!.first, ResolutionPreset.max);
    await cameraController!.initialize();
  }

  Future<void> takePicture() async {
    final image = await cameraController!.takePicture();
    Get.back(result: image.path);
  }

  Future<void> pickFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) Get.back(result: image.path);
  }

  Future<void> uploadInsuranceImage() async {
    if (!isActiveContinue.value) return;
    isLoading.value = true;
    try {
      Utils.showSnackBar(
        Get.context!,
        text: 'اطلاعات بیمه با موفقیت ثبت شد',
        status: StatusEnum.success,
      );
      Get.toNamed(TaxiRouteNames.vanSelfieAuth.uri);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> onUploadButtonTap() async {
    final result = await Get.to(
      TelegramStyleCamera(
        cameraController: cameraController,
        cameras: cameras,
        pickFromGallery: pickFromGallery,
        takePicture: takePicture,
      ),
    );
    isActiveContinue.value = result != null;
  }

  @override
  void onInit() {
    _initCamera();
    super.onInit();
  }

  @override
  void onClose() {
    cameraController?.dispose();
    super.dispose();
  }
}
