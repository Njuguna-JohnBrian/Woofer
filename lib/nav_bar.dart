import 'package:flutter/material.dart';
import 'package:woofer/theme.dart';
import 'package:woofer/woofer_pages.dart';

class NavScreen extends StatefulWidget {
  const NavScreen({Key? key}) : super(key: key);

  @override
  State<NavScreen> createState() => _NavScreenState();
}

class _NavScreenState extends State<NavScreen> {
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void _onTapped(int index) {
    setState(() {
      pageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: WFTheme.faintMainColor.withOpacity(
        0.45,
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _onTapped,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: WFTheme.mainColor,
        unselectedItemColor: Colors.grey.shade700,
        unselectedFontSize: 8,
        currentIndex: pageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.message,
            ),
            label: '',
          ),
        ],
      ),
      body: wooferPages[pageIndex],
    );
  }
}
