import 'package:carousel_slider_app/pages/playlist_page.dart';
import 'package:carousel_slider_app/pages/prayer_list_page.dart';
import 'package:carousel_slider_app/pages/prayerlist_updated_page.dart';
import 'package:carousel_slider_app/pages/tasbeeh_page.dart';
import 'package:carousel_slider_app/widgets/custom_navigationbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    PlaylistPage(),
    PrayerListPage(),
    TasbeehPage(),
    PrayerlistUpdated(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: BottomNavBar(
        curentIndex: _selectedIndex,
        backgroundColor: const Color.fromARGB(255, 237, 237, 237),
        onTap: (value) => setState(() {
          _selectedIndex = value;
        }),
        children: [
          BottomNavBarItem(
            title: "القائمة",
            icon: Icons.list_outlined,
          ),
          BottomNavBarItem(
            title: "المواقيت",
            icon: Icons.timelapse,
          ),
          BottomNavBarItem(
            title: 'تسبيح',
            icon: Icons.access_alarms,
          ),
          BottomNavBarItem(
            title: "حول",
            icon: Icons.chat,
          ),
        ],
      ),
      body: SafeArea(
        child: Center(child: _pages.elementAt(_selectedIndex)),
      ),
    );
  }
}
