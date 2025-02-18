import 'package:flutter/material.dart';
import 'widgets/bottom_nav_bar.dart';

class MainScreen extends StatefulWidget {
  final Widget child;
  final int currentIndex;
  final PreferredSizeWidget? appBar;

  const MainScreen({
    required this.child,
    required this.currentIndex,
    this.appBar,
    Key? key,
  }) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          widget.appBar ??
          AppBar(
            title: const Center(
              child: Text(
                "BOAT STARTER APP",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            backgroundColor: Colors.blueAccent,
          ),
      body: widget.child,
      bottomNavigationBar: BottomNavBar(
        currentIndex: widget.currentIndex,
        onTap: (index) {
          setState(() {}); // ✅ รองรับการเปลี่ยนหน้า
        },
      ),
    );
  }
}
