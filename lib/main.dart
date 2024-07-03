import 'package:exam/utils/app_routs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main()
{
  runApp(
      GetMaterialApp(
        debugShowCheckedModeBanner: false,
        routes: app_routs,
      )
  );
}