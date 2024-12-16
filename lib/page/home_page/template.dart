import 'package:flutter/material.dart';

class Template {
  final String title;
  final List<String> items;
  final List<Color> wheelColors;
  final String icon;
  final String image;
  final String imageItem;
  final String imageBackground;

  Template({
    required this.title,
    required this.items,
    required this.wheelColors,
    required this.icon,
    required this.image,
    required this.imageItem,
    required this.imageBackground
  });

  factory Template.fromJson(Map<String, dynamic> json) {
    List<Color> colors = (json['wheelColors'] as List)
        .map((colorString) => Color(int.parse(colorString)))
        .toList();

    return Template(
      title: json['title'],
      items: List<String>.from(json['items']),
      wheelColors: colors,
      image: json['image'],
      imageItem: json['imageItem'],
      imageBackground: json['imageBackground'],
      icon: json['icon'],
    );
  }
}