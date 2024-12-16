import 'package:flutter/material.dart';
import '../../../core/text_style.dart';
import '../../ads/dimens/ad_dimen.dart';

class IntroContent extends StatelessWidget {
  final String title;
  final String imageUrl;
  // final String adId;
  // final String factory;

  const IntroContent({
    super.key,
    required this.title,
    required this.imageUrl,
    // required this.adId,
    // required this.factory,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(imageUrl, fit: BoxFit.fill)),
        // Padding(
        //   padding: const EdgeInsets.only(
        //     bottom: AdDimen.languageNativeAdHeight + 65,
        //     left: 20,
        //     right: 20,
        //   ),
        //   child: Align(
        //     alignment: Alignment.bottomCenter,
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.end,
        //       children: [
        //         Text(
        //           textAlign: TextAlign.center,
        //           title,
        //           style: CustomTextStyles.textWhite20,
        //         ),
        //
        //       ],
        //     ),
        //   ),
        // ),
        // Align(
        //   alignment: Alignment.bottomCenter,
        //   child: EasyNativeAd(
        //     factoryId: factory,
        //     adId: adId,
        //     height: AdDimen.languageNativeAdHeight,
        //   ),
        // )
      ],
    );
  }
}
