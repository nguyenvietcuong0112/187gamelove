import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flip_card/flip_card.dart';
import 'package:tr187_gamelove/page/trueordare/question_page.dart';

import '../../core/colors.dart';
import '../../core/text_style.dart';

class TrueOrDarePage extends StatefulWidget {
  const TrueOrDarePage({super.key});

  @override
  _TrueOrDarePageState createState() => _TrueOrDarePageState();
}

class _TrueOrDarePageState extends State<TrueOrDarePage> {
  List<String> truthQuestions = [];
  List<String> dareQuestions = [];

  bool isMale = true;
  GlobalKey<FlipCardState> dareCardKey = GlobalKey<FlipCardState>();
  GlobalKey<FlipCardState> truthCardKey = GlobalKey<FlipCardState>();
  bool hasFlippedDare = false;
  bool hasFlippedTruth = false;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

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
              SizedBox(height: 10.h),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlipCard(
                      key: dareCardKey,
                      direction: FlipDirection.HORIZONTAL,
                      front: InkWell(
                        onTap: () => handleCardTap('dare'),
                        child: Container(
                          height: 200.h,
                          width: 150.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/bg_dare.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      back: InkWell(
                        onTap: () => handleCardTap('dare'),
                        child: Container(
                          height: 200.h,
                          width: 150.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/bg_dare.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 25.h),
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
                    SizedBox(height: 25.h),
                    FlipCard(
                      key: truthCardKey,
                      direction: FlipDirection.HORIZONTAL,
                      front: InkWell(
                        onTap: () => handleCardTap('truth'),
                        child: Container(
                          height: 200.h,
                          width: 150.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/bg_truth.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                      back: InkWell(
                        onTap: () => handleCardTap('truth'),
                        child: Container(
                          height: 200.h,
                          width: 150.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/bg_truth.png'),
                                fit: BoxFit.fill),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void handleCardTap(String type) {
    GlobalKey<FlipCardState> cardKey =
        type == 'dare' ? dareCardKey : truthCardKey;
    bool hasFlipped = type == 'dare' ? hasFlippedDare : hasFlippedTruth;

    if (!hasFlipped) {
      cardKey.currentState?.toggleCard();

      setState(() {
        if (type == 'dare') {
          hasFlippedDare = true;
        } else {
          hasFlippedTruth = true;
        }
      });

      Future.delayed(const Duration(milliseconds: 500), () {
        navigateToQuestion(type);
      });
    } else {
      navigateToQuestion(type);
    }
  }

  Future<void> loadQuestions() async {
    final jsonString = await DefaultAssetBundle.of(context)
        .loadString('assets/data/true_or_dare.json');
    final jsonData = json.decode(jsonString);

    setState(() {
      truthQuestions = List<String>.from(jsonData['truth']);
      dareQuestions = List<String>.from(jsonData['dare']);
    });
  }

  void navigateToQuestion(String type) {
    final randomIndex = Random().nextInt(
        type == 'truth' ? truthQuestions.length : dareQuestions.length);
    final question = type == 'truth'
        ? truthQuestions[randomIndex]
        : dareQuestions[randomIndex];

    setState(() {
      isMale = !isMale;
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuestionPage(
            question: question,
            onNext: () {
              setState(() {
                if (type == 'dare') {
                  hasFlippedDare = false;
                } else {
                  hasFlippedTruth = false;
                }
              });
              Navigator.pop(context);
            }),
      ),
    );
  }
}
