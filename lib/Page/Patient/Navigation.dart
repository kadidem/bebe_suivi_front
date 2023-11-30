// import 'package:flutter/material.dart';
import 'package:bebe_suivi/Page/Patient/AcceuilPatient.dart';
import 'package:bebe_suivi/Page/Patient/Bebe.dart';
import 'package:bebe_suivi/Page/Patient/Calendar.dart';
import 'package:bebe_suivi/Page/Patient/Forum.dart';
import 'package:bebe_suivi/Page/Patient/GrossesseListe.dart';
import 'package:bebe_suivi/Page/Patient/Medicament.dart';
import 'package:flutter/material.dart';
//import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int pageIndex = 0;
  PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const AcceuilPatient(),
      GrossesseListe(),
      const Bebe(),
      Medicament(),
      const Calendar(),
      const Forum(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home),
        title: "Acceuil",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.pregnant_woman),
        title: "Grossesse",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.child_care),
        title: "Bébé",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.medical_services),
        title: "Medicament",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.calendar_today),
        title: "Calendar",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.forum),
        title: "Forum",
        activeColorPrimary: Colors.blue,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      navBarHeight: 80,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      onItemSelected: (index) {
        setState(() {
          pageIndex = index;
        });
      },
      //itemCount: 6,
      navBarStyle: NavBarStyle.style12,
    );
  }
}
