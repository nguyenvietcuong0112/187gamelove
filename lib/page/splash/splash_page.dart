import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../core/text_style.dart';
import '../../di/dependency_injection.dart';
import '../../service/ads_service.dart';
import '../../service/initialization_helper.dart';
import '../../service/share_preference_service.dart';
import '../language/language_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  static Route<dynamic> getRoute(RouteSettings settings) => GetPageRoute(
        page: () => const SplashPage(),
        settings: settings,
      );

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final sharedPreferences = getIt<SharedPreferences>();


  // final _initializationHelper = InitializationHelper();

  @override
  void initState() {
    super.initState();
    // EasyAds.instance.appLifecycleReactor?.setOnSplashScreen(true);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
    //   if (!getIt<SharedPreferenceService>().getFullAds()) {
    //     await AdsService().checkFullAds();
    //   }
    //
    //   await _initializationHelper.initialize().then((value) {
    //     Future.delayed(const Duration(seconds: 2), _showInterAds);
      // });
      _handleNavigate();

    });

  }

  bool isInitializedAds = false;

  // void _showInterAds() {
  //   return EasyAds.instance.showInterstitialAd(
  //     context,
  //     adId: MyAdIdName.interSplash.getId,
  //     onShowed: () async {
  //       Get.back();
  //       _handleNavigate();
  //     },
  //     onFailed: () {
  //       Get.back();
  //       _handleNavigate();
  //     },
  //   );
  // }

  Future<void> _handleNavigate() async {
    // await EasyAds.instance.initAdmob(
    //   appOpenAdUnitId: MyAdIdName.appOpenResume.getId,
    // );
    // isFirst = sharedPreferences.getBool(SharedPrefConsts.firstOpenApp) ?? true;
    // EasyAds.instance.appLifecycleReactor?.setOnSplashScreen(false);
    // if (isFirst) {
      Get.off(() => const LanguagePage(fromSplash: true,));
    // } else {
    //   Get.off(() => const IntroPage());
    // }
  }

  bool get isAndroid => GetPlatform.isAndroid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Image.asset('assets/images/logo.png', height: 100.h),
              ),
              SizedBox(height: 12.h),
              Text(
                AppConstants.appName,
                style: CustomTextStyles.textBlack20,
              ),
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).padding.bottom + 10,
            child: Column(
              children: [
                CircularProgressIndicator(color: AppColors.appTextColorGrey),
                SizedBox(height: 10.h),
                if (isInitializedAds)
                  Text(
                    "Loading",
                    style:  TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.appTextColorGrey,
                    ),
                  )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

