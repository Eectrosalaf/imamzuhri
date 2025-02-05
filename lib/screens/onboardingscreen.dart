import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants.dart';
import '../utils/screensize.dart';
import '../widgets/buttons.dart';
import '../widgets/onboarding.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  int _currentPage = 0;
  List colors = const [
    Color(0xffDAD3C8),
    Color(0xffFFE5DE),
    Color(0xffDCF6E6),
  ];

  AnimatedContainer _buildDots({
    int? index,
  }) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: DesignColors.primaryColor,
      ),
      margin: const EdgeInsets.only(left: 3),
      height: 5,
      curve: Curves.easeIn,
      width: _currentPage == index ? 40 : 15,
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // double width = SizeConfig.screenW!;
    // double height = SizeConfig.screenH!;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: _controller,
                onPageChanged: (value) => setState(() => _currentPage = value),
                itemCount: contents.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: Image.asset(
                            fit: BoxFit.contain,
                            contents[i].image,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                          //   //height: (height >= 840) ? 60 : 30,
                        ),
                        Text(
                          contents[i].title,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      //  const SizedBox(height: 0),
                        Text(
                          contents[i].desc,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.grey[20],
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 20),
                        Row(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            contents.length,
                            (int index) => _buildDots(
                              index: index,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    _currentPage + 1 == contents.length
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Botton(
                                    colour: Colors.white,
                                    tcolour: DesignColors.primaryColor,
                                    title: 'Log In',
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/loginscreen');
                                      //           //_controller.jumpToPage(2);
                                    }),
                                const SizedBox(
                                  height: 16,
                                ),
                                Botton(
                                    bcolour: DesignColors.primaryColor,
                                    colour: DesignColors.primaryColor,
                                    // // gradient: const LinearGradient(
                                    // //     colors: [
                                    // //       Color(0xff0d5c58),
                                    // //       Color.fromARGB(255, 21, 168, 161),
                                    // //     ],
                                    //     begin: Alignment.topCenter,
                                    //     end: Alignment.bottomCenter),
                                    tcolour: Colors.white,
                                    title: 'Register',
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, '/signupscreen');
                                    }),
                              ],
                            ),
                          )
                        : Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Botton(
                                    colour: Colors.white,
                                    tcolour: DesignColors.primaryColor,
                                    title: 'Next',
                                    onPressed: () {
                                      _controller.nextPage(
                                        duration:
                                            const Duration(milliseconds: 200),
                                        curve: Curves.easeIn,
                                      );
                                    }),
                                const SizedBox(
                                  height: 20,
                                ),
                                Botton(
                                  bcolour:  DesignColors.primaryColor,
                                  // gradient: const LinearGradient(colors: [
                                  //    Color(0xff0d5c58),
                                  //         Color.fromARGB(255, 21, 168, 161),
                                  // ]),
                                  colour: DesignColors.primaryColor,
                                  tcolour: Colors.white,
                                  title: 'Skip',
                                  onPressed: () {
                                    _controller.jumpToPage(2);
                                  },
                                ),
                              ],
                            ),
                          )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
