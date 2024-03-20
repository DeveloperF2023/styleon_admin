import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'bindings.dart';
import 'core/localization/change_local.dart';
import 'core/localization/translation.dart';
import 'core/services/services.dart';
import 'routes.dart';

void main() async {
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocaleController localeController = Get.put(LocaleController());
    return ScreenUtilInit(
      builder: (_, child) {
        return GetMaterialApp(
          translations: AppTranslation(),
          useInheritedMediaQuery: true,
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          locale: localeController.language,
          initialBinding: AppBindings(),
          getPages: routes,
        );
      },
    );
  }
}
