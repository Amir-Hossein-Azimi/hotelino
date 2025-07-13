import 'package:Hotelino/features/onboarding/presentation/onboarding_provider.dart';
import 'package:Hotelino/features/onboarding/presentation/widget/onboarding_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    //we just want get data not listen and use provider
    final onboardingProvider = Provider.of<OnboardingProvider>(context);

    //get data 
    final onboardingData = onboardingProvider.onboardingData;
    final int totalPage = onboardingData.length;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: totalPage,
              onPageChanged: onboardingProvider.updateCurrentPage,
              itemBuilder:  (context, index) {
                final data = onboardingData[index];
                return OnboardingItem(title: data["title"]!, description: data["description"]!, 
                image: data["image"]!);
              },
            
            ),
          ),
          const SizedBox(height: 20,),
          buildPageIndicator(onboardingProvider.currentPage, totalPage, context),
          const SizedBox(height: 20,)

        ],
      ),

    );
  }
  Widget buildPageIndicator(int currentIndex , int totalPage , BuildContext context ) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: 
        List.generate(totalPage, (index) => AnimatedContainer(duration: Duration(microseconds: 300),
        margin: EdgeInsets.symmetric(horizontal: 5),
        width: currentIndex == index ? 12 :8,
        height: currentIndex == index ? 12 : 8,
        decoration: BoxDecoration(
          color: currentIndex == index
          ? theme.colorScheme.primary
          : theme.colorScheme.primary.withValues(alpha: 0.3)
        ),
        )
        ,)
    );
  }
}