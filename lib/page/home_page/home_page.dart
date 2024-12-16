import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:tr187_gamelove/page/steamy_challange/steamy_challange.dart';
import 'package:tr187_gamelove/page/trueordare/true_or_dare.dart';

import '../../core/text_style.dart';
import '../mischievous/mischievous_page.dart';
import '../settings/settings.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/bg_home.png'),
                  fit: BoxFit.fill)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.05.sh,
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ic_tittle_home.svg',
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      "Game",
                      style: CustomTextStyles.textGreen26,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () {
                        Get.to(() => const SettingsPage());
                      },
                      child: SvgPicture.asset(
                        'assets/icons/ic_settings.svg',
                      ),
                    ),
                  ],
                ),
                _widgetHome()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _widgetHome() {
    return Column(
      children: [
        SizedBox(height: 15.h),
        _itemHome(
            const MischievousDicePage(), 'assets/images/bg_mischievous.png'),
        SizedBox(height: 15.h),
        _itemHome(const TrueOrDarePage(), 'assets/images/bg_true_or_dare.png'),
        SizedBox(height: 15.h),
        _itemHome(const SteamyChallangePage(),
            'assets/images/bg_steamy_challage.png'),
      ],
    );
  }

  Widget _itemHome(Widget widget, String image) {
    return InkWell(
      onTap: () {
        Get.to(() => widget);
      },
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(image), fit: BoxFit.fill)),
        padding: EdgeInsets.symmetric(vertical: 60.h),
      ),
    );
  }
}
