import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/colors.dart';
import '../../core/constants.dart';
import '../../core/text_style.dart';
import '../language/language_page.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => SettingsPageState();
}

class SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: appBody(),
      ),
    );
  }

  appBody() {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_home.png'),
                fit: BoxFit.fill)),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 0.05.sh),
                Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/ic_back.svg',
                        color: AppColors.colorTextGreen,
                      ),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      'Settings',
                      style: CustomTextStyles.textGreen22Bold,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => const LanguagePage(
                          fromSplash: false,
                        ));
                  },
                  child: _item('assets/icons/ic_language.svg', "Language"),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    _shareApp();
                  },
                  child: _item('assets/icons/ic_share.svg', "Share app"),
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    openPrivacy();
                  },
                  child: _item('assets/icons/ic_policy.svg', "Policy"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _item(String sourceImage, String name) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
          color: const Color(0XFF2C0846),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          SvgPicture.asset(
            sourceImage,
            width: 20.h,
            color: const Color(0XFFDA1C9A),
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(name,
              style: CustomTextStyles.textWhite16
                  .copyWith(fontWeight: FontWeight.w100)),
          const Spacer(),
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0XFF22BBDC),
            size: 16,
          ),
        ],
      ),
    );
  }

  Future<void> _shareApp() async {
    final packageInfo = await PackageInfo.fromPlatform();
    String url = '';
    if (GetPlatform.isIOS) {
      url = 'https://apps.apple.com/app/id${AppConstants.appIdIOS}';
    } else {
      url =
          'https://play.google.com/store/apps/details?id=${packageInfo.packageName}';
    }
    await Share.share(url);
  }

  Future<void> openPrivacy() async {
    await launchUrl(Uri.parse(AppConstants.privacyUrl)).then((value) {});
  }
}
