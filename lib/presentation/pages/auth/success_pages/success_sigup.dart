import 'package:enefty_icons/enefty_icons.dart';
import 'package:admin/presentation/widgets/auth/background_image.dart';
import 'package:admin/presentation/widgets/auth/button_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/image_assets.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/constants/strings.dart';
import '../../../widgets/global/form_container.dart';
import '../../../widgets/global/text_app.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie/success.json",height: 300,width: 300),
          sizeVertical(20),
          const TextApp(text: "Congratulations\n Successfully Registration",fontSize: 25,color: Colors.black54,fontWeight: FontWeight.w700,textAlign: TextAlign.center,),
          sizeVertical(20),
          ButtonWidget(text: "Home Page"),

        ],
      )),
    );
  }
}
