import 'package:Hotelino/features/onboarding/presentation/onboarding_provider.dart';
import 'package:Hotelino/features/onboarding/presentation/widget/onboarding_button.dart';
import 'package:Hotelino/features/onboarding/presentation/widget/onboarding_item.dart';
import 'package:Hotelino/routes/app_route.dart';
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

    final theme = Theme.of(context);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: totalPage,
              onPageChanged: onboardingProvider.updateCurrentPage,
              itemBuilder: (context, index) {
                final data = onboardingData[index];
                return OnboardingItem(
                  title: data["title"]!,
                  description: data["description"]!,
                  image: data["image"]!,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          buildPageIndicator(
            onboardingProvider.currentPage,
            totalPage,
            context,
          ),
          const SizedBox(height: 20),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            OnboardingButton(
              visible: onboardingProvider.currentPage > 0, 
              icon: Icons.arrow_back, 
              onPressed: () => _previousPage() , 
              backgroundcolor: Colors.transparent, 
              iconColor: theme.colorScheme.primary
              ),
               OnboardingButton(
              visible: onboardingProvider.currentPage < totalPage -1, 
              icon: Icons.arrow_forward, 
              onPressed: () => _nextPage(), 
              backgroundcolor: theme.colorScheme.primary, 
              iconColor: Colors.white
              )

            ],

          ),
          ),
          const SizedBox(height: 30,),
          if(totalPage > 1) ...[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return SizeTransition(
                  child: child,
                  sizeFactor: animation , 
                  axisAlignment: -1,
                  );
              },
              child: onboardingProvider.currentPage == totalPage -1
              ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(onPressed: () {
                    Navigator.pushReplacementNamed(context, AppRoute.home);
                  }, child: const Text("شروع رزرو هتل ها")),
                ),
              )
              : null
            
            )
          ]

        ],
      ),
    );
  }
  
  void _nextPage() {
    final onboardingProvider = Provider.of<OnboardingProvider>(context , listen: false) ;
    if(onboardingProvider.currentPage < onboardingProvider.onboardingData.length -1){
      _pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  void _previousPage(){
    final onboardingProvider = Provider.of<OnboardingProvider>(context , listen: false);
    if(onboardingProvider.currentPage > 0){
      _pageController.previousPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  Widget buildPageIndicator(
    int currentIndex,
    int totalPage,
    BuildContext context,
  ) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPage,
        (index) => AnimatedContainer(
          duration: const Duration(microseconds: 300),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          width: currentIndex == index ? 12 : 8,
          height: currentIndex == index ? 12 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index
                ? theme.colorScheme.primary
                : theme.colorScheme.primary.withValues(alpha: 0.3),
          ),
        ),
      ),
    );
  }
}
