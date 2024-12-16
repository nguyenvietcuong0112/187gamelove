import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants.dart';

class SharedPreferenceService {
  final SharedPreferences sharedPreferences;

  SharedPreferenceService(this.sharedPreferences);

  Future<void> setFullAds(bool value) async {
    await sharedPreferences.setBool(SharedPrefConsts.fullAds, value);
  }

  bool getFullAds() {
    return sharedPreferences.getBool(SharedPrefConsts.fullAds) ?? false;
  }
}
