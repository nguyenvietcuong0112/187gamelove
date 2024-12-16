
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tr187_gamelove/core/text_style.dart';

import 'colors.dart';

class AppListTile extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget leading;
  final String title;
  final Widget trailing;
  final EdgeInsets padding;
  final String? color;

  const AppListTile({
    super.key,
    this.onTap,
    required this.leading,
    required this.title,
    this.padding = const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
    this.trailing = const SizedBox(),
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap?.call,
      child: Container(
        decoration:  BoxDecoration(
          color: Color(int.parse(color!)),
        ),
        child: Padding(
          padding: padding,
          child: Row(
            children: [
              leading,
              SizedBox(width: 10.w),
              Text(
                title,
                style: CustomTextStyles.textWhite16
              ),
              const Spacer(),
              trailing,
            ],
          ),
        ),
      ),
    );
  }
}
