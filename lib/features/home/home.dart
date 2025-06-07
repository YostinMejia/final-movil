import 'package:chiva_exp/features/home/widgets/custom_app_bar.dart';
import 'package:chiva_exp/features/home/widgets/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final List<Widget> pages;
  const HomeScreen({super.key, required this.pages});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
        bottomNavigationBar: CustomBottomNavBar(currentIndex: 1,onTap: (value){setState(() =>_currentIndex = value);},),
        body: widget.pages[_currentIndex]
      );
  }
}