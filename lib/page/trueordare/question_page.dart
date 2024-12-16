import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../core/colors.dart';
import '../../core/text_style.dart';

class QuestionPage extends StatelessWidget {
  final String question;
  final VoidCallback onNext;

  const QuestionPage({super.key, required this.question, required this.onNext});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/bg_home.png'),
                fit: BoxFit.fill)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
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
                    'True Or Dare',
                    style: CustomTextStyles.textGreen22Bold
                        .copyWith(color: AppColors.colorTextGreen),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 30.w),
                decoration: BoxDecoration(
                    color: const Color(0XFF391947),
                    borderRadius: BorderRadius.circular(18)),
                child: Text(question,
                    textAlign: TextAlign.center,
                    style: CustomTextStyles.textWhite16),
              ),
              SizedBox(height: 20.h),
              InkWell(
                onTap: onNext,
                child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 8.h, horizontal: 50.w),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            colors: [Color(0XFF9515C2), Color(0XFFD21A88)]),
                        borderRadius: BorderRadius.circular(70)),
                    child: Text(
                      'Next',
                      style: CustomTextStyles.textWhite20Bold,
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
