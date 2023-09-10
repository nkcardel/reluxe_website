// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reluxe_website/custom_widgets/custom_text.dart';
import 'package:reluxe_website/responsive.dart';

import 'provider/navbar_provider.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool isLoading = false;
  String isSelected = 'Home';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavBarProvider>(context);

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: Responsive.isDesktop(context) ? 40 : 20, vertical: 15),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!Responsive.isMobile(context)) navBarItems(provider.isSelected),
        ],
      ),
    );
  }

  Widget navBarItems(String isSelected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        navButton('Home', isSelected == 'Home' || isSelected == '', () {
          final provider = Provider.of<NavBarProvider>(context, listen: false);
          provider.setSelected('Home');
          print('isSelected: $isSelected');
          GoRouter.of(context).go('/');
        }),
        navButton('Properties', isSelected == 'Properties', () {
          final provider = Provider.of<NavBarProvider>(context, listen: false);
          provider.setSelected('Properties');
          print('isSelected: $isSelected');
          //GoRouter.of(context).go('/about');
        }),
        navButton('About', isSelected == 'About', () {
          final provider = Provider.of<NavBarProvider>(context, listen: false);
          provider.setSelected('About');
          print('isSelected: $isSelected');
          //GoRouter.of(context).go('/media');
        }),
      ],
    );
  }

  Widget navButton(String text, bool selected, void Function()? onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: TextButton(
        onPressed: onPressed,
        child: BodyText(
          text: text,
          textColor: selected ? Colors.blue : Colors.black,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          //letterSpacing: selected ? 0.5 : 0,
        ),
      ),
    );
  }
}
