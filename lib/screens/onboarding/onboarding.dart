import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:woofer/screens/signup/signup.dart';
import 'package:woofer/theme.dart';

import 'onboarding_utils/onboarding_strings.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController controller = PageController();
  List<ImageProvider> backgroundImages = [
    AssetImage(OnboardingStrings.scrn1_img),
    AssetImage(OnboardingStrings.scrn2_img),
    AssetImage(OnboardingStrings.scrn3_img),
  ];
  List<String> pageTexts = [
    OnboardingStrings.scrn1_text,
    OnboardingStrings.scrn2_text,
    OnboardingStrings.scrn3_text,
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const SignUpScreen(),
                ),
                (route) => false,
              );
            },
            style: TextButton.styleFrom(
              shape: const StadiumBorder(),
              minimumSize: const Size(
                80,
                10,
              ),
              backgroundColor: WFTheme.mainColor,
              foregroundColor: Colors.white,
            ),
            child: const Text(
              "Skip",
            ),
          )
        ],
      ),
      body: PageView.builder(
        controller: controller,
        itemCount: backgroundImages.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.black.withOpacity(0.8),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image(
                  image: backgroundImages[index],
                  fit: BoxFit.cover,
                ),
                Column(
                  children: [
                    Expanded(
                      child: buildPages(
                        context,
                        index,
                      ),
                    ),
                    buildIndicator(),
                    SizedBox(
                      height: size.height * 0.15,
                    ),
                    buildActionButtons(context),
                    SizedBox(
                      height: size.height * 0.04,
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildPages(BuildContext context, int index) {
    return onboardingPageView(
      pageTexts[index],
      context,
    );
  }

  Widget onboardingPageView(String text, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Text(
            text,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
                fontSize: 24),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: size.height * 0.025,
          ),
        ],
      ),
    );
  }

  Widget buildIndicator() {
    return SmoothPageIndicator(
      controller: controller,
      count: 3,
      effect: const ExpandingDotsEffect(
        activeDotColor: WFTheme.mainColor,
        dotColor: WFTheme.faintMainColor,
        dotHeight: 8,
        dotWidth: 10,
      ),
    );
  }

  Widget buildActionButtons(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: WFTheme.mainColor,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    controller.previousPage(
                      duration: const Duration(
                        seconds: 1,
                      ),
                      curve: Curves.ease,
                    );
                  },
                  icon: const Icon(
                    Icons.chevron_left,
                    size: 50,
                    color: WFTheme.faintMainColor,
                  ),
                ),
              ),
            ),
            CircleAvatar(
              radius: 30,
              backgroundColor: WFTheme.mainColor,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    if (controller.page == 2.0) {
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const SignUpScreen(),
                        ),
                        (route) => false,
                      );
                    } else {
                      controller.nextPage(
                        duration: const Duration(
                          seconds: 1,
                        ),
                        curve: Curves.ease,
                      );
                    }
                  },
                  icon: const Icon(
                    Icons.chevron_right,
                    size: 50,
                    color: WFTheme.faintMainColor,
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
