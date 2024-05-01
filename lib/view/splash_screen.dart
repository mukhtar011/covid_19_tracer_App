import 'dart:async';
import 'package:covid_tracer_app/view/world_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration:  const Duration(seconds: 3),
      vsync: this)..repeat();
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds:5) ,
            () =>  Navigator.push(context,
                MaterialPageRoute(builder: (context) => WorldStateScreen()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _controller,
                child: Container(
                  height: 200,
                  width: 200,
                 child: Center(
                    child: Image(image: AssetImage("assets/images/virus.png")),
                ),
                ),
                builder: (BuildContext context, Widget? child){
                return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: child,
                );
                }),
            SizedBox(height: MediaQuery.of(context).size.height * .08,),
            Align(
              alignment: Alignment.center,
            ),
            Text("Covid-19\n Tracker App",
              style: TextStyle(
                color: Colors.white,
              fontSize: 25, fontWeight: FontWeight.bold,
            ),)
            ],
        ),
      ),
    );
  }
}
