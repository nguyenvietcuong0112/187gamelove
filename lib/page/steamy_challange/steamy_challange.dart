import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tr187_gamelove/page/steamy_challange/widget/grid_item.dart';
import 'package:tr187_gamelove/page/steamy_challange/widget/popup_dialog.dart';
import 'package:tr187_gamelove/page/steamy_challange/widget/section_header.dart';

import '../../core/colors.dart';
import '../../core/text_style.dart';

class SteamyChallangePage extends StatefulWidget {
  const SteamyChallangePage({super.key});

  @override
  _SteamyChallangePageState createState() => _SteamyChallangePageState();
}

class _SteamyChallangePageState extends State<SteamyChallangePage> {
  List<Map<String, String>> dataRomantic = [];
  List<Map<String, String>> dataProvocative = [];
  List<String?> displayedImages = [];
  List<String?> displayedImagesProvoCative = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    dataRomantic =
        await DataLoader.loadData('assets/data/steamy_challenge1.json');
    dataProvocative =
        await DataLoader.loadData('assets/data/steamy_challenge2.json');
    setState(() {
      displayedImages = List<String?>.filled(dataRomantic.length, null);
      displayedImagesProvoCative =
          List<String?>.filled(dataProvocative.length, null);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/bg_home.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                  Text('Steamy Challange',
                      style: CustomTextStyles.textGreen22Bold),
                ],
              ),
              SizedBox(height: 10.h),
              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.w),
                    child: Column(
                      children: [
                        const SectionHeader(
                          iconPath: 'assets/icons/ic_romantic.svg',
                          title: "Romantic Invitation",
                        ),
                        SizedBox(height: 10.h),
                        _buildGrid(
                          data: dataRomantic,
                          displayedImages: displayedImages,
                          onTap: (index) => _showPopup(index, true),
                        ),
                        SizedBox(height: 20.h),
                        const SectionHeader(
                          iconPath: 'assets/icons/ic_provocative.svg',
                          title: "Provocative Opening",
                        ),
                        SizedBox(height: 10.h),
                        _buildGrid(
                          data: dataProvocative,
                          displayedImages: displayedImagesProvoCative,
                          onTap: (index) => _showPopup(index, false),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGrid({
    required List<Map<String, String>> data,
    required List<String?> displayedImages,
    required void Function(int index) onTap,
  }) {
    return data.isEmpty
        ? const Center(child: CircularProgressIndicator())
        : GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            padding: EdgeInsets.symmetric(vertical: 10.h),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return GridItem(
                image: displayedImages[index],
                onTap: () => onTap(index),
              );
            },
          );
  }

  void _showPopup(int index, bool isRomantic) {
    final data = isRomantic ? dataRomantic : dataProvocative;
    final images = isRomantic ? displayedImages : displayedImagesProvoCative;

    showDialog(
      context: context,
      builder: (context) {
        return PopupDialog(
          imagePath: data[index]['image']!,
          text: data[index]['text']!,
          onGo: () {
            Navigator.of(context).pop();
            setState(() {
              images[index] = null;
            });
            Future.delayed(const Duration(milliseconds: 300), () {
              setState(() {
                images[index] = data[index]['image'];
              });
            });
          },
        );
      },
    );
  }
}

class DataLoader {
  static Future<List<Map<String, String>>> loadData(String path) async {
    final jsonString = await rootBundle.loadString(path);
    final jsonData = json.decode(jsonString) as List<dynamic>;
    return jsonData.map((e) => Map<String, String>.from(e)).toList();
  }
}
