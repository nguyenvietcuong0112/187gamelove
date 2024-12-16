import 'package:device_info_plus/device_info_plus.dart';
import 'package:get/get.dart';
import 'package:tr187_gamelove/service/share_preference_service.dart';

import '../di/dependency_injection.dart';

class AdsService {
  Future<void> checkFullAds() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

    bool isPhysicalDevice = true;

    if (GetPlatform.isAndroid) {
      final androidInfo = await deviceInfoPlugin.androidInfo;
      isPhysicalDevice = androidInfo.isPhysicalDevice;
    } else if (GetPlatform.isIOS) {
      final iosInfo = await deviceInfoPlugin.iosInfo;
      isPhysicalDevice = iosInfo.isPhysicalDevice;
    }

    await getIt<SharedPreferenceService>().setFullAds(isPhysicalDevice);
  }
}
