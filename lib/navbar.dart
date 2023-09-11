// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reluxe_website/custom_widgets/custom_text.dart';
import 'package:reluxe_website/responsive.dart';

import 'constants.dart';
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
    return Container(
      height: 80,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
            width: 1,
          ),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Responsive.isDesktop(context) ? 60 : 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/logo.png',
              height: 100,
            ),
            if (!Responsive.isMobile(context)) navBarItems(provider.isSelected),
          ],
        ),
      ),
    );
  }

  Widget navBarItems(String isSelected) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        navItem('Home', isSelected == 'Home' || isSelected == '', () {
          final provider = Provider.of<NavBarProvider>(context, listen: false);
          provider.setSelected('Home');
          GoRouter.of(context).go('/');
        }),
        navItem('Properties', isSelected == 'Properties', () {
          final provider = Provider.of<NavBarProvider>(context, listen: false);
          provider.setSelected('Properties');
          //GoRouter.of(context).go('/about');
        }),
        navItem('About', isSelected == 'About', () {
          final provider = Provider.of<NavBarProvider>(context, listen: false);
          provider.setSelected('About');
          //GoRouter.of(context).go('/media');
        }),
        SizedBox(width: 15),
        navButton('Login / Sign up', isSelected == 'Login', () {
          final provider = Provider.of<NavBarProvider>(context, listen: false);
          provider.setSelected('Login');
          //GoRouter.of(context).go('/media');
        }),
        navItem('EN | PHP', isSelected == 'Currency', () {
          final provider = Provider.of<NavBarProvider>(context, listen: false);
          provider.setSelected('Currency');
          //GoRouter.of(context).go('/media');
        }),
      ],
    );
  }

  Widget navItem(String text, bool selected, void Function()? onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: selected ? blueColor : Colors.transparent,
            width: selected ? 3 : 0,
          ),
        ),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: BodyText(
          text: text,
          textColor: selected ? blueColor : Colors.black,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          //letterSpacing: selected ? 0.5 : 0,
        ),
      ),
    );
  }

  Widget navButton(String text, bool selected, void Function()? onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: ElevatedButton(
        style: filledButtonStyle,
        onPressed: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: BodyText(
            text: text,
            textColor: Colors.white,
            fontWeight: FontWeight.normal,
            //letterSpacing: selected ? 0.5 : 0,
          ),
        ),
      ),
    );
  }
}
