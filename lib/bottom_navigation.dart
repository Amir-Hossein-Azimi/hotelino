import 'package:flutter/material.dart';

//create for navigation uI change->statefull and set state
//bottomNavigation Material 3
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedIndex = 0;

  List<Widget> widgetOptions = [
    Center(child: Text("Home Screen", style: TextStyle(fontSize: 28))),
    Center(child: Text("Search Screen", style: TextStyle(fontSize: 28))),
    Center(child: Text("Setting Screen", style: TextStyle(fontSize: 28))),
  ];

  void onItemTapped(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetOptions[selectedIndex],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add), 
        ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: "home"),
          NavigationDestination(
            icon: Icon(Icons.search),
            label: "Search",
            tooltip: "Search",
          ),
          NavigationDestination(icon: Icon(Icons.settings), label: "Setting"),
        ],
        selectedIndex: selectedIndex,

        onDestinationSelected: onItemTapped,
        elevation: 0,
        height: 76,
       // backgroundColor: Colors.white,
       // indicatorColor: Colors.blue,
      ),
    );
  }
}
