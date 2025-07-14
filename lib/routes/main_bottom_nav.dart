import 'package:Hotelino/routes/test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
class MainBottomNav extends StatefulWidget {
  const MainBottomNav({super.key});

  @override
  State<MainBottomNav> createState() => _MainBottomNavState();
}

class _MainBottomNavState extends State<MainBottomNav> {
  //because set in run 
  late PersistentTabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }
  _buildScreens(){
    return [HomePage() , FavoritePage() , BookingPage() , ProfilePage()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: SvgPicture.asset("assets/images/nav_home.svg" , width: 20, height: 20, colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),),
         
        )
    ];

  }


  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context, 
      controller: _controller,
      onItemSelected: (value) {},
      screens: []
      );
  }
}