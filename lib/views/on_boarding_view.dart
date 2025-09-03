import 'package:expense_tracker/on_boarding/on_boarding1.dart';
import 'package:expense_tracker/on_boarding/on_boarding2.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  static const String onBoardingRoute = 'OnBoardingView';

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  // The controller to keep track of which page we're on
  final controller = PageController();
  // Keep track if we are on the last page or not
  bool onLastPage = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index) {
              setState(() {
                onLastPage = (index == 1);
              });
            },
            controller: controller,
            children: [OnBoarding1(), OnBoarding2()],
          ),

          Container(
            alignment: Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // skip button
                GestureDetector(
                  onTap: () {
                    controller.jumpToPage(1);
                  },
                  child: controller.page == 1 ? Text('') : Text(
                    'Skip',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ),
                ),
                // dot indicator
                SmoothPageIndicator(controller: controller, count: 2,effect: ExpandingDotsEffect(
                  dotWidth: 10,
                  dotHeight: 10,
                  dotColor: Theme.of(context).colorScheme.onSecondaryFixedVariant,
                  activeDotColor: Theme.of(context).colorScheme.onPrimary,
                ),),

                // next button
                onLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, OnBoarding2.onBoarding2Route);
                        },
                        child: Text(
                          'Done',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn,
                          );
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
