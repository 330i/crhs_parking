import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:crhs_parking_app/admin/pages/revoke.dart';
import 'package:crhs_parking_app/admin/pages/waiting_list.dart';
import 'package:flutter/material.dart';
import 'settings.dart';

class Navigation extends StatefulWidget {
  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex=0;
  PageController _pageController = PageController(
      initialPage: 0
  );
  var _pageOptions = [
    WaitingList(),
    Revoke(),
    Settings(),
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: _pageOptions,
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          showElevation: true, // use this to remove appBar's elevation
          itemCornerRadius: 20,
          curve: Curves.easeInBack,
          onItemSelected: (index) => setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          }),
          items: [
            BottomNavyBarItem(
              icon: Icon(Icons.list),
              title: Text('Waiting List'),
              activeColor: Colors.green,
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.clear),
                title: Text('Revoke Parking Access'),
                activeColor: Colors.red
            ),
            BottomNavyBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings'),
                activeColor: Colors.grey
            ),
          ],
        )
    );
  }
}
