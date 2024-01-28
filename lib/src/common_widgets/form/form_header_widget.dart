import 'dart:core';

import 'package:flutter/material.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:health_first/src/features/authentication/screens/login/login_form_widget.dart';
class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    Key? key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.imageHeight =0.2,
    this.textAlign,
    this.crossAxisAlignment= CrossAxisAlignment.start,

  }) : super(key: key);
  final Color? imageColor;
  final double imageHeight;
  final double? heightBetween;


  final String image, title, subTitle;
  final CrossAxisAlignment crossAxisAlignment;
  final TextAlign? textAlign;


  @override
  Widget build(BuildContext context) {
    final size =MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image:AssetImage(image),color: imageColor,height: size.height*imageHeight,
        ),
        SizedBox(height: heightBetween,),
        Text(title,style: Theme.of(context).textTheme.displaySmall,),
        Text(subTitle,textAlign:textAlign,style: Theme.of(context).textTheme.bodyLarge,),
      ],
    );
  }
}
