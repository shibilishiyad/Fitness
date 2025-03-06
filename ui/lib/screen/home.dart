import 'dart:ui';
import 'package:fitness/screen/bmi.dart';
import 'package:fitness/screen/profile.dart';
import 'package:fitness/utils/screen_util.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  bool showInitialImage = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    // Fade in, wait, then fade out
    _controller.forward();
    Future.delayed(const Duration(seconds: 2), () {
      _controller.reverse().then((_) {
        setState(() {
          showInitialImage = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: false,
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: const ClampingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: ScreenUtil.hight,
                        width: ScreenUtil.width,
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          image: DecorationImage(
                            image: AssetImage(
                                "lib/asset/images/pexels-panther-1547248.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      if (showInitialImage)
                        AnimatedBuilder(
                          animation: _controller,
                          builder: (context, child) {
                            return Opacity(
                              opacity: _fadeAnimation.value,
                              child: Container(
                                height: ScreenUtil.hight,
                                width: ScreenUtil.width,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "lib/asset/images/initial.JPG"),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 100),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.transparent,
                          ),
                          height: 100,
                          width: ScreenUtil.width,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 50),
                                child: Row(
                                  children: [
                                    Text(
                                      'Grow',
                                      style: TextStyle(
                                          fontSize: 35,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.grey),
                                    ),
                                    Text(
                                      'Mode',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 200),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Text('Product',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const BMIScreen()));
                                      },
                                      child: const Text('Health',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)),
                                    ),
                                    const Text('Chat',
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white)),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    const Profile()));
                                      },
                                      child: const Text('Profile',
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white)),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 240, left: 90),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "GrowMode",
                              style: TextStyle(
                                fontSize: 80,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none,
                                shadows: const [
                                  Shadow(
                                    blurRadius: 30,
                                    color: Colors.amberAccent,
                                    offset: Offset(0, 0),
                                  ),
                                ],
                                foreground: Paint()
                                  ..shader = const LinearGradient(
                                    colors: [
                                      Colors.amberAccent,
                                      Colors.orangeAccent
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ).createShader(
                                      const Rect.fromLTWH(0, 0, 300, 90)),
                              ),
                            ),
                            const SizedBox(height: 20),
                            const Text(
                              "Sculpt Your Strength\nOwn Your Growth",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 24,
                                height: 1.5,
                                fontWeight: FontWeight.w300,
                                letterSpacing: 1.2,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
