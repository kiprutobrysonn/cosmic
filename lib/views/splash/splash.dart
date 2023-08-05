import 'dart:async';
import 'dart:ui';

import 'package:cosmic/views/home/home.dart';
import 'package:cosmic/views/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 296,
        width: 296,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/splash/splash01.png"))),
        child: Center(
          child: Stack(
            children: [
              Container(
                width: 296,
                height: 296,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(296),
                    boxShadow: [
                      BoxShadow(color: Colors.transparent, blurRadius: 10)
                    ]),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 12, sigmaY: 12),
                ),
              ),
              Container(
                width: 288,
                height: 288,
                color: Colors.transparent,
                child: Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SvgPicture.asset(
                        "assets/splash/Vector.svg",
                        height: 76.06,
                        width: 200,
                      ),
                    ),
                    width: 296,
                    height: 296,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(296),
                      border: Border.all(color: Colors.white),
                    ),
                  ),
                ),
              ),
              Container(
                width: 300,
                height: 296,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(288),
                  border: Border.all(color: Colors.white, width: 1),
                ),
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CustomPaint(
                        painter: _OverlayPainter(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

class _OverlayPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2;
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final center = Offset(size.width / 2, size.height / 2);

    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(0.5, 0.5, size.width - 1, size.height - 1),
          Radius.circular(radius - 0.5)),
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
