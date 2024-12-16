import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tr187_gamelove/core/app_list_tile.dart';

import '../../../core/text_style.dart';

class PopupDialog extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onGo;

  const PopupDialog({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onGo,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: const Color(0XFF391947),
      actions: [
        Padding(
          padding:  EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(imagePath, width: 80),
                SizedBox(height: 10.w),
                Text(text, style: CustomTextStyles.textWhite16, textAlign: TextAlign.center),
                SizedBox(height: 20.h),
                InkWell(
                  onTap: onGo,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 50),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0XFF9515C2), Color(0XFFD21A88)]),
                      borderRadius: BorderRadius.circular(70),
                    ),
                    child: Text("Go", style: CustomTextStyles.textWhite20Bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}