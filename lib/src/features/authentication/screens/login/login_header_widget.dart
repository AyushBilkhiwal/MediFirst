import 'package:flutter/material.dart';
import 'package:health_first/src/constants/image_strings.dart';
import 'package:health_first/src/constants/sizes.dart';
import 'package:health_first/src/constants/text_strings.dart';
import 'package:health_first/src/features/authentication/screens/login/login_form_widget.dart';
class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(image: AssetImage(tWelcomeScreenImage),height: size.height*0.2,
        ),
        Text(tLoginTitle,style: Theme.of(context).textTheme.displaySmall,),
        Text(tLoginSubTitle,style: Theme.of(context).textTheme.bodyLarge,),
      ],
    );
  }
}
