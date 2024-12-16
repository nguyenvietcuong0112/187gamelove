
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/default_route.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:tr187_gamelove/core/app_list_tile.dart';

import '../../di/dependency_injection.dart';
import '../../service/share_preference_service.dart';
import '../ads/dimens/ad_dimen.dart';
import '../home_page/home_page.dart';
import 'widgets/intro_content.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  static Route<dynamic> getRoute(RouteSettings settings) => GetPageRoute(
        page: () => const IntroPage(),
        settings: settings,
      );

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final preloadController = PreloadPageController();
  int currentPage = 0;
  bool get _isFullAds => getIt<SharedPreferenceService>().getFullAds();
  // String get _nativeIntroFactory => !_isFullAds
  //     ? MyAdIdName.nativeIntro1
  //     : MyAdIdName.nativeLanguageNonOrganic;

  late final List<Widget> pages;
  bool isShowNextButton = false;

  late Widget nextButton;
  String backButtonText = "";

  @override
  void initState() {
    preloadController.addListener(() {
      if (preloadController.page?.round() != currentPage) {
        currentPage = preloadController.page!.round();
      }
      changeTextListener();
    });
    super.initState();
  }


  @override
  void didChangeDependencies() {
    nextButton = SvgPicture.asset(
      'assets/icons/ic_nextIntro.svg',
    );
    backButtonText = "Previous";
    pages = [
      IntroContent(
        title: 'Spin the wheel to choose options with joy',
        imageUrl: 'assets/images/intro_1.png',
        // adId: MyAdIdName.nativeIntro1.getId,
        // factory: _nativeIntroFactory,
      ),
      IntroContent(
        title: 'Create your own spin wheel rapidly',
        imageUrl: 'assets/images/intro_2.png',
        // factory: MyAdIdName.nativeIntro2,
        // adId: _isFullAds ? MyAdIdName.nativeIntro2.getId : '',
      ),
      IntroContent(
        title: 'Enjoy funny moments with friends while deciding',
        imageUrl: 'assets/images/intro_3.png',
        // factory: MyAdIdName.nativeIntro3,
        // adId: _isFullAds ? MyAdIdName.nativeIntro3.getId : '',
      ),
      IntroContent(
        title: 'Diverse and lively collection of wheels to select',
        imageUrl: 'assets/images/intro_4.png',
        // adId: MyAdIdName.nativeIntro4.getId,
        // factory: _nativeIntroFactory,
      ),
    ];

    preloadController.addListener(() {
      changeTextListener();
    });
    super.didChangeDependencies();
  }

  Future<void> _handleNavigate() async {
    Get.to(() => const HomePage());
  }

  double getBottomPadding() {
    if (_isFullAds) {
      if (currentPage == 0 || currentPage == 2) {
        return AdDimen.languageNativeAdHeight + 25;
      } else {
        return AdDimen.languageNativeAdHeight + 10;
      }
    } else {
      if (currentPage == 1 || currentPage == 2) {
        return 10;
      } else {
        return AdDimen.languageNativeAdHeight + 25;
      }
    }
  }
  // void _showInterAds() {
  //   EasyAds.instance.showInterstitialAd(
  //     context,
  //     adId: MyAdIdName.interIntro.getId,
  //     onShowed: () {
  //       Get.back();
  //       _handleNavigate();
  //     },
  //     onFailed: () {
  //       Get.back();
  //       _handleNavigate();
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            PreloadPageView(
              physics: const NeverScrollableScrollPhysics(),
              preloadPagesCount: 4,
              controller: preloadController,
              children: pages,
            ),
            Padding(
              padding: EdgeInsets.only(bottom:  10.h),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: AdDimen.languageNativeAdHeight),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              currentPage == 0
                                  ? 'assets/icons/ic_indicator_true.svg'
                                  : 'assets/icons/ic_indicator.svg',
                              height: 10,
                              width: 10,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset(
                              currentPage == 1
                                  ? 'assets/icons/ic_indicator_true.svg'
                                  : 'assets/icons/ic_indicator.svg',
                              height: 10,
                              width: 10,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset(
                              currentPage == 2
                                  ? 'assets/icons/ic_indicator_true.svg'
                                  : 'assets/icons/ic_indicator.svg',
                              height: 10,
                              width: 10,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            SvgPicture.asset(
                              currentPage == 3
                                  ? 'assets/icons/ic_indicator_true.svg'
                                  : 'assets/icons/ic_indicator.svg',
                              height: 10,
                              width: 10,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 10.h),
                        child: GestureDetector(
                          onTap: () async {
                            if (currentPage == 3) {
                              // if(_isFullAds) {
                              // _showInterAds(); }
                              // else {
                              Get.to(() => const HomePage());

                              // _handleNavigate();
                              // }
                            } else {
                              preloadController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.linear,
                              );
                            }
                          },
                          child: nextButton,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeTextListener() {
    if (currentPage != 3) {
      setState(() {
        nextButton = SvgPicture.asset(
          'assets/icons/ic_nextIntro.svg',
        );
      });
    } else {
      setState(() {
        nextButton = SvgPicture.asset(
          'assets/icons/ic_nextIntro.svg',
        );
      });
    }
  }
}
