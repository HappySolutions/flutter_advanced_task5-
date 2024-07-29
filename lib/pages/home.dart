import 'package:carousel_slider_app/pages/playlist_page.dart';
import 'package:carousel_slider_app/pages/prayer_list_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  static const List<Widget> _pages = <Widget>[PlaylistPage(), PrayerListPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'القائمة',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            label: 'المواقيت',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'حول',
          ),
        ],
        currentIndex: _selectedIndex, //New
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: Center(child: _pages.elementAt(_selectedIndex)),
      ),
    );
  }
}
