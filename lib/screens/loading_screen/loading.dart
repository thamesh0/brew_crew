import 'signin_options.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _coffeeController;
  bool isGreenCoffee = false; // show brown coffee first
  bool isTextReady = false;

  late bool showSignIn;
  void toggleView() => setState(() {
    showSignIn = !showSignIn;
  });

  @override
  void initState() {
    super.initState();
    _coffeeController = AnimationController(vsync: this);
    _coffeeController.addListener(() {
      if (_coffeeController.value > 0.7) {
        _coffeeController.stop();
        isGreenCoffee = true; // now show green coffee

        setState(() {});

        Future.delayed(const Duration(seconds: 1), () {
          isTextReady = true;
          setState(() {});
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _coffeeController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xfff8dc9c),
      body: Stack(
        children: [
          Visibility(visible: isGreenCoffee, child: const BottomPart()),
          AnimatedContainer(
            height: isGreenCoffee ? (height / 1.45) : height,
            duration: const Duration(seconds: 1),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                    offset: Offset(3, 3),
                    blurRadius: 10,
                    spreadRadius: 2,
                    color: Colors.black26),
              ],
              borderRadius: BorderRadius.only(
                bottomLeft: isGreenCoffee
                    ? const Radius.circular(25)
                    : const Radius.circular(0),
                bottomRight: isGreenCoffee
                    ? const Radius.circular(25)
                    : const Radius.circular(0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AnimatedCrossFade(
                  firstChild: Lottie.asset('assets/images/coffee_green.json'),
                  secondChild: Lottie.asset('assets/images/coffee_brown.json',
                      height: height / 2,
                      controller: _coffeeController, onLoaded: (composition) {
                    _coffeeController.duration = composition.duration;
                    _coffeeController.forward();
                  }),
                  crossFadeState: isGreenCoffee
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: const Duration(seconds: 2),
                ),
                Center(
                  child: AnimatedOpacity(
                    opacity: isTextReady ? 1 : 0,
                    duration: const Duration(seconds: 1),
                    child: const Text(
                      'Coffee Cups',
                      style: TextStyle(
                          fontFamily: 'Lobster',
                          fontSize: 50,
                          color: Color(0xff674335),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


