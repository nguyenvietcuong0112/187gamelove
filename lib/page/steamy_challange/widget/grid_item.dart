import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GridItem extends StatelessWidget {
  final String? image;
  final VoidCallback onTap;

  const GridItem({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0XFF441A47),
        ),
        child: Center(
          child: image == null
              ? SvgPicture.asset('assets/icons/ic_heart.svg', fit: BoxFit.fill)
              : Image.asset(image!, fit: BoxFit.fill),
        ),
      ),
    );
  }
}