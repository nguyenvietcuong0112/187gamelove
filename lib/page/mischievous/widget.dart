import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tr187_gamelove/core/text_style.dart';

class DiceDisplay extends StatelessWidget {
  final bool isLoading;
  final bool showFirstImage;
  final String text;
  final bool isAction;

  const DiceDisplay({
    super.key,
    required this.isLoading,
    required this.showFirstImage,
    required this.text,
    required this.isAction,
  });

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Lottie.asset(
            'assets/anim/quay.json',
            width: 150,
            height: 150,
          )
        : Container(
            width: 150,
            height: 150,
            decoration: showFirstImage
                ? BoxDecoration(
                    color: const Color(0XFF391947),
                    image: const DecorationImage(
                      image: AssetImage('assets/images/bg_default_mischie.png'),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(18),
                  )
                : BoxDecoration(
                    color: const Color(0XFF391947),
                    borderRadius: BorderRadius.circular(18),
                  ),
            child: Center(
              child: Text(
                text,
                style: CustomTextStyles.textWhite20Bold,
              ),
            ),
          );
  }
}
