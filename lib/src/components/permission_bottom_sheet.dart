import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';

class PermissionBottomSheet extends StatelessWidget {
  final bool requestCamera;
  final bool requestMicrophone;
  final bool requestStorage;
  final bool requestClipboard;
  final VoidCallback? onGranted;

  const PermissionBottomSheet({
    super.key,
    this.requestCamera = false,
    this.requestMicrophone = false,
    this.requestStorage = false,
    this.requestClipboard = false,
    this.onGranted,
  });

  Future<void> _requestPermissions(BuildContext context) async {
    bool allGranted = true;

    if (requestCamera) {
      SystemSound.play(SystemSoundType.click);
      final status = await Permission.camera.request();
      allGranted &= status.isGranted;
    }

    if (requestMicrophone) {
      final status = await Permission.microphone.request();
      allGranted &= status.isGranted;
    }

    if (requestStorage) {
      final status = await Permission.photos.request();
      allGranted &= status.isGranted;
    }

    if (requestClipboard) {
      allGranted &= true;
    }

    if (allGranted) {
      Navigator.of(context).pop();
      onGranted?.call();
    }
  }

  String _buildTitle() {
    if (requestCamera &&
        requestMicrophone &&
        requestStorage &&
        requestClipboard) {
      return 'دسترسی‌های مورد نیاز';
    } else if (requestCamera) {
      return 'دسترسی به دوربین';
    } else if (requestMicrophone) {
      return 'دسترسی به میکروفون';
    } else if (requestStorage) {
      return 'دسترسی به عکس‌ها';
    } else if (requestClipboard) {
      return 'دسترسی به کلیپ‌بورد';
    } else {
      return 'درخواست دسترسی';
    }
  }

  String _buildDescription() {
    List<String> messages = [];

    if (requestCamera && requestMicrophone) {
      messages.add(
        'برای اسکن چهره با دوربین و ضبط ویدیو لطفاً اجازه دسترسی به دوربین و میکروفون را بدهید.',
      );
    } else if (requestCamera) {
      messages.add('برای اسکن چهره لطفاً اجازه دسترسی به دوربین را بدهید.');
    } else if (requestMicrophone) {
      messages.add('برای ضبط صدا لطفاً اجازه دسترسی به میکروفون را بدهید.');
    }

    if (requestStorage) {
      messages.add('برای دسترسی به گالری، اجازه دسترسی به عکس‌ها لازم است.');
    }

    if (requestClipboard) {
      messages.add(
        'برای خواندن یا نوشتن داده از کلیپ‌بورد لطفاً اجازه دسترسی را تایید کنید.',
      );
    }

    return messages.join('\n\n');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Theme.of(context).brightness == Brightness.dark
              ? Theme.of(context).scaffoldBackgroundColor
              : Theme.of(context).colorScheme.surfaceContainer,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _buildTitle(),
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Text(
              _buildDescription(),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(
                  Theme.of(context).primaryColor,
                ),
              ),
              onPressed: () => _requestPermissions(context),
              child: Text(
                'اجازه دادن',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
