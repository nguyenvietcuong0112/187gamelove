import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../core/app_list_tile.dart';
import '../../core/colors.dart';
import '../../core/common.dart';
import '../../core/text_style.dart';
import '../../di/dependency_injection.dart';
import '../../generated/l10n.dart';
import '../../main.dart';
import '../intro/intro_page.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key, required this.fromSplash}) : super(key: key);
  final bool fromSplash;

  static Route<dynamic> getRoute(RouteSettings settings) {
    bool isFromSplash;
    try {
      isFromSplash = settings.arguments as bool;
    } catch (e) {
      isFromSplash = true;
    }
    return GetPageRoute(
      page: () => LanguagePage(fromSplash: isFromSplash),
      settings: settings,
    );
  }

  @override
  State<LanguagePage> createState() => _LanguageState();
}

class LoggerUtil {}

class _LanguageState extends State<LanguagePage> {
  final sharedPreferences = getIt<SharedPreferences>();

  // final nativeFactory = !getIt<SharedPreferenceService>().getFullAds()
  //     ? MyAdIdName.nativeLanguage
  //     : MyAdIdName.nativeLanguageNonOrganic;

  Locale? _selectedLocale;

  @override
  void initState() {
    super.initState();
  }

  final RxBool _isSelected = false.obs;

  final RxBool _loadingLanguageSelect = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF1D0A39),
        title: Row(
          children: [
            Text(
              "Select Language",
              style: CustomTextStyles.textWhite20Bold,
            ),
          ],
        ),
        actions: [
          Obx(
            () => Padding(
              padding: EdgeInsets.only(right: 10.h),
              child: _loadingLanguageSelect.value
                  ? SizedBox(
                      height: 25,
                      width: 25,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          AppColors.lightPrimaryColor,
                        ),
                        strokeWidth: 3,
                      ),
                    )
                  : GestureDetector(
                      child: SvgPicture.asset(
                        'assets/icons/ic_tick.svg',
                        height: 24.h,
                      ),
                      onTap: () async {
                        if (_selectedLocale != null) {
                          await Get.find<SettingService>()
                              .updateLocale(_selectedLocale!);
                          if (widget.fromSplash) {
                            Get.off(() => const IntroPage());
                          } else {
                            Get.back();
                          }
                        } else {
                          AppCommon.showToast(
                            'You need to choose language to continue!',
                            duration: 1.5.seconds,
                          );
                        }
                      },
                    ),
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_home.png'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            Expanded(
              child: StatefulBuilder(builder: (_, setLanguageState) {
                return ListView(
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                  children: [
                    ...BS.delegate.supportedLocales.map((e) {
                      return AppListTile(
                        onTap: () {
                          _selectedLocale = e;
                          if (!_isSelected.value) {
                            _isSelected.value = true;
                            _loadingLanguageSelect.value = true;
                            Future.delayed(
                              1500.milliseconds,
                              () {
                                _loadingLanguageSelect.value = false;
                              },
                            );
                          }
                          setLanguageState(() {});
                        },
                        leading: Image.asset(
                          e.pathIcon,
                          height: 30,
                          width: 30,
                        ),
                        title: e.name,
                        trailing: _trailing(e),
                        color: _selectedLocale == e
                            ? '${00000000}'
                            : '${00000000}',
                      );
                    }),
                  ],
                );
              }),
            ),
            // if (widget.fromSplash)
            //   Obx(() {
            //     return EasyNativeAd(
            //       factoryId: nativeFactory,
            //       adId: _isSelected.value
            //           ? MyAdIdName.nativeLanguageSelect.getId
            //           : MyAdIdName.nativeLanguage.getId,
            //       height: AdDimen.languageNativeAdHeight,
            //       key: UniqueKey(),
            //     );
            //   })
            // else
            //   Align(
            //     alignment: Alignment.bottomCenter,
            //     child: EasyBannerAd(
            //       adId: MyAdIdName.bannerCollapse.getId,
            //       isCollapsible: true,
            //     ),
            //   ),
          ],
        ),
      ),
    );
  }

  Widget _trailing(Locale locale) {
    return (_selectedLocale == null &&
            locale.toString() == "en" &&
            widget.fromSplash == true)
        ? Stack(
            children: [
              Container(
                padding: EdgeInsets.only(right: 3.w),

                child: SvgPicture.asset(
                  'assets/icons/ic_lang_unselected.svg',
                ),
              ),
              SizedBox(
                height: 30,
                width: 20,
                child: Lottie.asset(
                  "assets/anim/hand.json",
                  fit: BoxFit.fitWidth,
                  repeat: true,
                  animate: true,
                ),
              ),
            ],
          )
        : _selectedLocale == locale
            ? SvgPicture.asset(
                'assets/icons/ic_lang_selected.svg',
              )
            : Container(
                padding: EdgeInsets.only(right: 2.w),
                child: SvgPicture.asset(
                  'assets/icons/ic_lang_unselected.svg',
                ),
              );
  }
}

extension LocaleExt on Locale {
  String get pathIcon {
    switch (languageCode) {
      case 'en':
        {
          return 'assets/images/flag_en.png';
        }
      case 'fr':
        {
          return 'assets/images/flag_fr.png';
        }
      case 'hi':
        {
          return 'assets/images/flag_hi.png';
        }
      case 'es':
        {
          return 'assets/images/flag_es.png';
        }
      case 'de':
        {
          return 'assets/images/flag_de.png';
        }
      case 'it':
        {
          return 'assets/images/flag_italia.png';
        }
      case 'pt':
        {
          return 'assets/images/flag_portugese.png';
        }
      case 'ko':
        {
          return 'assets/images/flag_korea.png';
        }
      case 'id':
        {
          return 'assets/images/flag_indo.png';
        }
    }

    return 'assets/images/flag_en.png';
  }

  String get name {
    switch (languageCode) {
      case 'en':
        {
          return 'English';
        }
      case 'fr':
        {
          return 'French';
        }
      case 'hi':
        {
          return 'Hindi';
        }
      case 'es':
        {
          return 'Spanish';
        }
      case 'de':
        {
          return 'German';
        }
      case 'it':
        {
          return 'Italia';
        }
      case 'pt':
        {
          return 'Portuguese';
        }
      case 'ko':
        {
          return 'Korea';
        }
      case 'id':
        {
          return 'Indonesian';
        }
    }
    return 'English';
  }
}
