import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tr187_gamelove/di/dependency_injection.config.dart';

import '../main.dart';
import '../service/share_preference_service.dart';


final getIt = GetIt.instance;

@injectableInit
Future<void> configure(String environment) async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerSingleton<SharedPreferences>(sharedPreferences);

  getIt.registerSingleton<SharedPreferenceService>(
      SharedPreferenceService(sharedPreferences));

  final AppsFlyerOptions appsFlyerOptions = AppsFlyerOptions(
    afDevKey: 'LikYKU2zUYTct7BoQ7MuJY',
  );

  final AppsflyerSdk appsflyerSdk = AppsflyerSdk(appsFlyerOptions);

  getIt.registerSingleton<AppsflyerSdk>(appsflyerSdk);
}

void configureDependencies() => getIt.init(environment: env);
