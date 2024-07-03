import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Get.offAllNamed('home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(
              "https://thumbs.dreamstime.com/b/trolley-28470651.jpg",
              height: 300 ,
              width: 300,
            ),
            Text("Shopping now...",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)
          ],
        )
      ),
    );
  }
}
