import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_storage/get_storage.dart';
import 'package:multi_vendor/screens/main_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);
  static const String id = 'onboard-screen';

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  double scrollerPosition = 0;
  final store = GetStorage();

  onButtonPressed(context) {
    // Before going to homescreen, app will save to device that, this user already
    // Seen the dashboard screen, so next time this screen should not open
    // for that we will use a package called getStorage
    //now will change 'onBoarding value to true
    store.write('onBoarding', true);
   return Navigator.pushReplacementNamed(
        context, MainScreen.id);
   //now the value should change to true, if we restart again screen should
    //directly move to home screen
  }

  @override
  Widget build(BuildContext context) {
    //Untuk menstop lanscape mode
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (val) {
              setState(() {
                scrollerPosition = val.toDouble();
              });
            },
            children: [
              OnBoardPage(
                bordColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Welcome\nTo Shop App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 28),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '+10 Million Product\n+100 Categories\n+20 Brands',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.yellowAccent,
                          fontSize: 24),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 300,
                      width: 300,
                      child: Image.asset('assets/images/2.png'),
                    ),
                  ],
                ),
              ),
              OnBoardPage(
                bordColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      'Welcome\nTo Shop App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 28),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '+10 Million Product\n+100 Categories\n+20 Brands',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 400,
                      width: 300,
                      child: Image.asset('assets/images/3.png'),
                    ),
                  ],
                ),
              ),
              OnBoardPage(
                bordColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      'Welcome\nTo Shop App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 28),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '+10 Million Product\n+100 Categories\n+20 Brands',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 400,
                      width: 300,
                      child: Image.asset('assets/images/4.png'),
                    ),
                  ],
                ),
              ),
              OnBoardPage(
                bordColumn: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    const Text(
                      'Welcome\nTo Shop App',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 28),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '+10 Million Product\n+100 Categories\n+20 Brands',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24),
                    ),
                    SizedBox(
                      height: 400,
                      width: 300,
                      child: Image.asset('assets/images/1.png'),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                DotsIndicator(
                  dotsCount: 4,
                  position: scrollerPosition,
                  decorator: const DotsDecorator(activeColor: Colors.white),
                ),
                scrollerPosition == 3
                    ? Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.deepOrange)),
                          child: const Text('Mulai Berbelanja',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                            ),
                          ),
                          onPressed: () {
                            onButtonPressed(context);
                          },
                        ),
                      )
                    : TextButton(
                        child: const Text(
                          'SKIP TO THE APP >',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        onPressed: () {},
                      ),
                const SizedBox(
                  height: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class OnBoardPage extends StatelessWidget {
  final Column? bordColumn;
  const OnBoardPage({Key? key, this.bordColumn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.deepOrange,
          child: Center(
            child: bordColumn,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: MediaQuery.of(context).size.width, //screen width
            height: 100,
            decoration: const BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100))),
          ),
        ),
      ],
    );
  }
}
