import 'package:get/get_utils/src/platform/platform.dart';

class SharedPrefConsts {
  static const rateKey = "RATE_KEY";
  static const notFirstLaunchApp = 'not_first_launch_app';
  static const firstOpenApp = 'FIRST_OPEN_APP';
  static const exitAppCount = 'exit_app_count';

  static const fullAds = 'fullAds';
}

class AppConstants {
  static const String privacyUrl = '';
  static final appIdIOS = GetPlatform.isAndroid ? '' : '';

  static const String appName = 'Spin Wheel of Decisions';
}

