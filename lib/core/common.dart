import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
class AppCommon {
  static showLoading() {
    EasyLoading.show(status: 'Saving...');
  }

  static showSuccess() {
    EasyLoading.showToast(
      'Saved!',
      duration: const Duration(milliseconds: 500),
    );
  }

  static Future<void> showToast(
    String mess, {
    Duration duration = const Duration(milliseconds: 500),
  }) {
    return EasyLoading.showToast(
      mess,
      duration: duration,
    );
  }

  static dismissLoading() {
    EasyLoading.dismiss();
  }
}
