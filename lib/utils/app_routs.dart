import 'package:exam/screen/cart/view/cart_screen.dart';
import 'package:exam/screen/home/view/home_screen.dart';
import 'package:exam/screen/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder>app_routs={
  "/":(context) => const SplashScreen(),
  "home":(context) => const HomeScreen(),
  "cart":(context) => const CartScreen()
};