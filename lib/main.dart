import 'package:appsflyer_sdk/appsflyer_sdk.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tr187_gamelove/page/splash/splash_page.dart';
import 'di/dependency_injection.dart';
import 'generated/l10n.dart';

const String env = Environment.dev;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  configureDependencies();
  await configure(env);
  await Get.putAsync(() => SettingService().init());

  runApp(const MyApp());

  await _initAppsflyer();

}

Future<void> _initAppsflyer() async {
  final appsflyerSdk = getIt<AppsflyerSdk>();

  // await EasyAds.instance.initAppsflyer(appsflyerSdk);
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: ScreenUtilInit(
        designSize: const Size(414, 736),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, widget) {
          SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
              overlays: []);
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              BS.delegate,
            ],
            builder: EasyLoading.init(),
            home: const SplashPage(),
            locale: SettingService().currentLocate.value,
            supportedLocales: BS.delegate.supportedLocales,
          );
        },
      ),

    );
  }
}

class SettingService extends GetxService {
  final Rx<Locale> currentLocate =
      const Locale.fromSubtags(languageCode: 'en').obs;

  late SharedPreferences prefs;

  Future<SettingService> init() async {
    prefs = await SharedPreferences.getInstance();

    final String languageCode = prefs.getString('languageCode') ?? 'en';
    final locale = BS.delegate.supportedLocales.firstWhere(
          (element) => element.languageCode == languageCode,
      orElse: () => const Locale.fromSubtags(languageCode: 'en'),
    );
    currentLocate.value = locale;
    await Get.updateLocale(locale);

    return this;
  }

  Future<void> updateLocale(Locale locale) async {
    final newLocale = BS.delegate.supportedLocales.firstWhere(
          (element) => element.languageCode == locale.languageCode,
      orElse: () => const Locale.fromSubtags(languageCode: 'en'),
    );
    await prefs.setString('languageCode', newLocale.languageCode);
    currentLocate.value = newLocale;
    await Get.updateLocale(newLocale);
  }


}

