import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/text_style.dart';


class SectionHeader extends StatelessWidget {
  final String iconPath;
  final String title;

  const SectionHeader({
    super.key,
    required this.iconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(iconPath),
        SizedBox(width: 10.w),
        Text(
          title,
          style: CustomTextStyles.textWhite16,
        ),
      ],
    );
  }
}