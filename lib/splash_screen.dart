import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:social_pen/gen/assets.gen.dart';
import 'package:social_pen/main_screen.dart';
import 'package:social_pen/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) => {
          Navigator.of(context)
              .pushReplacement(MaterialPageRoute(builder: (context) => const MainScreen()))
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 64, child: Assets.images.logo.image()),
                const SizedBox(
                  height: 32,
                ),
                const SpinKitFadingCube(
                  color: SolidColors.primeryColor,
                  size: 50.0,
                )
              ]),
        ),
      ),
    );
  }
}
