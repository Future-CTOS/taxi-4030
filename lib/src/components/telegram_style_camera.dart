import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class TelegramStyleCamera extends StatelessWidget {
  const TelegramStyleCamera({
    super.key,
    required this.cameraController,
    required this.cameras,
    required this.pickFromGallery,
    required this.takePicture,
  });

  final CameraController? cameraController;
  final List<CameraDescription>? cameras;
  final void Function() pickFromGallery;
  final void Function() takePicture;

  @override
  Widget build(BuildContext context) {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: Stack(
        children: [
          CameraPreview(cameraController!),
          Positioned(
            bottom: 30,
            left: 30,
            child: FloatingActionButton(
              onPressed: pickFromGallery,
              child: const Icon(Icons.photo),
            ),
          ),
          Positioned(
            bottom: 30,
            right: MediaQuery.of(context).size.width / 2 - 30,
            child: FloatingActionButton(
              onPressed: takePicture,
              child: const Icon(Icons.camera),
            ),
          ),
        ],
      ),
    );
  }
}
