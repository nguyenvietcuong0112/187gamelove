import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tr187_gamelove/page/mischievous/widget.dart';

import '../../core/colors.dart';
import '../../core/text_style.dart';

class MischievousDicePage extends StatefulWidget {
  const MischievousDicePage({super.key});

  @override
  _MischievousDicePageState createState() => _MischievousDicePageState();
}

class _MischievousDicePageState extends State<MischievousDicePage> {
  String? action;
  String? bodyPart;
  bool isLoading = false;
  bool showFirstImage = true;
  bool isMale = true;
  bool canClick = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_home.png'),
                fit: BoxFit.fill)),
        child: Column(
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
                  'Mischievous Dice',
                  style: CustomTextStyles.textGreen22Bold,
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  isMale ? Icons.male : Icons.female,
                  color: isMale
                      ? const Color(0XFF22BBDC)
                      : const Color(0XFFDA1C9A),
                  size: 30.sp,
                ),
                SizedBox(width: 5.w),
                Text(
                  isMale ? "Boy" : "Girl",
                  style: isMale
                      ? CustomTextStyles.textGreen22
                      : CustomTextStyles.textPink20,
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Center(
              child: Column(
                children: [
                  DiceDisplay(
                    isLoading: isLoading,
                    showFirstImage: showFirstImage,
                    text: action ?? '',
                    isAction: true,
                  ),
                  SizedBox(height: 20.h),
                  Image.asset(
                    'assets/images/img_divider.png',
                    height: 2.h,
                    fit: BoxFit.fitWidth,
                    width: 1.sw,
                  ),
                  SizedBox(height: 20.h),
                  DiceDisplay(
                    isLoading: isLoading,
                    showFirstImage: showFirstImage,
                    text: bodyPart ?? '',
                    isAction: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            InkWell(
              onTap: () {
                handleGoButton();
              },
              child: Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 80.w),
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          colors: [Color(0XFF9515C2), Color(0XFFD21A88)]),
                      borderRadius: BorderRadius.circular(70)),
                  child: Text(
                    showFirstImage ? 'Go' : 'Continue',
                    style: CustomTextStyles.textWhite20Bold,
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Map<String, String>>> loadJsonData() async {
    final jsonData =
        await rootBundle.loadString('assets/data/mischievous_dice.json');
    final data = json.decode(jsonData);

    return List<Map<String, String>>.from(
      (data['pairs'] as List<dynamic>).map(
        (pair) => {
          "action": pair["action"].toString(),
          "bodyPart": pair["bodyPart"].toString(),
        },
      ),
    );
  }

  void handleGoButton() async {
    if (!canClick) return;

    setState(() {
      canClick = false;
      isLoading = true;
      showFirstImage = false;
      isMale = !isMale;
    });

    await Future.delayed(const Duration(seconds: 5));

    final pairs = await loadJsonData();
    if (!mounted) return;

    if (pairs.isEmpty) {
      setState(() {
        isLoading = false;
        action = 'No data';
        bodyPart = '';
        canClick = true;
      });
      return;
    }

    final selectedPair = (pairs..shuffle()).first;

    setState(() {
      action = selectedPair['action'];
      bodyPart = selectedPair['bodyPart'];
      isLoading = false;
      canClick = true;
    });
  }
}
