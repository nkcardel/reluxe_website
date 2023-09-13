// ignore_for_file: prefer_const_constructors

import 'package:dropdown_button2/dropdown_button2.dart';
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

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: Responsive.isDesktop(context) ? 80 : 70,
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
            GestureDetector(
              onTap: () => GoRouter.of(context).go('/'),
              child: Image.asset(
                'assets/logo.png',
                height: Responsive.isDesktop(context) ? 70 : 45,
              ),
            ),
            Responsive.isDesktop(context)
                ? navBarItems()
                : Responsive.isTablet(context)
                    ? subMenu(w, h)
                    : subMenu(w, h),
          ],
        ),
      ),
    );
  }

  Widget navBarItems() {
    return Consumer<NavBarProvider>(builder: (context, provider, _) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navItem('Home',
              provider.isSelected == 'Home' || provider.isSelected == '', () {
            final provider =
                Provider.of<NavBarProvider>(context, listen: false);
            provider.setSelected('Home');
            print('isSelected: ${provider.isSelected}');
            GoRouter.of(context).go('/');
          }),
          navItem('Properties', provider.isSelected == 'Properties', () {
            final provider =
                Provider.of<NavBarProvider>(context, listen: false);
            provider.setSelected('Properties');
            print('isSelected: ${provider.isSelected}');
            GoRouter.of(context).go('/properties');
          }),
          navItem('About', provider.isSelected == 'About', () {
            final provider =
                Provider.of<NavBarProvider>(context, listen: false);
            provider.setSelected('About');
            GoRouter.of(context).go('/about');
          }),
          SizedBox(width: 15),
          navButton('Login / Sign up', provider.isSelected == 'Login', () {
            final provider =
                Provider.of<NavBarProvider>(context, listen: false);
            provider.setSelected('Login');
            //GoRouter.of(context).go('/media');
          }),
          navItem('EN | PHP', provider.isSelected == 'Currency', () {
            final provider =
                Provider.of<NavBarProvider>(context, listen: false);
            provider.setSelected('Currency');
            //GoRouter.of(context).go('/media');
          }),
        ],
      );
    });
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

  Widget subMenu(double width, double height) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        customButton: const Icon(
          Icons.menu,
          color: blueColor,
        ),
        items: [
          ...SubMenuItems.firstItems.map(
            (item) => DropdownMenuItem<SubMenuItem>(
              value: item,
              child: SubMenuItems.buildItem(item, context),
            ),
          ),
          const DropdownMenuItem<Widget>(
              enabled: false, child: SizedBox(height: 0)),
          ...SubMenuItems.secondItems.map(
            (item) => DropdownMenuItem<SubMenuItem>(
              value: item,
              child: SubMenuItems.buildItem(item, context),
            ),
          ),
          const DropdownMenuItem<Widget>(
              enabled: false, child: SizedBox(height: 0)),
        ],
        onChanged: (value) {
          SubMenuItems.onChanged(context, value! as SubMenuItem);
        },
        dropdownStyleData: DropdownStyleData(
          width: width,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white, //Colors.blue.shade900,
          ),
          offset: const Offset(0, -15),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            ...List<double>.filled(SubMenuItems.firstItems.length, 48),
            10,
            ...List<double>.filled(SubMenuItems.secondItems.length, 48),
            15,
          ],
          padding: const EdgeInsets.only(left: 16, right: 16),
        ),
      ),
    );
  }
}

class SubMenuItem {
  const SubMenuItem({
    required this.text,
  });

  final String text;
}

abstract class SubMenuItems {
  static const List<SubMenuItem> firstItems = [
    home,
    properties,
    about,
  ];

  static const List<SubMenuItem> secondItems = [login];

  static const home = SubMenuItem(text: 'Home');
  static const properties = SubMenuItem(text: 'Properties');
  static const about = SubMenuItem(text: 'About');
  static const login = SubMenuItem(text: 'Login / Sign up');

  static Widget buildItem(SubMenuItem item, BuildContext context) {
    double w = MediaQuery.of(context).size.width; // Set the width

    return item.text != 'Login / Sign up'
        ? SizedBox(
            width: w,
            height: 45,
            child: Align(
              alignment: Alignment.centerLeft,
              child: BodyText(
                text: item.text,
              ),
            ),
          )
        : SizedBox(
            width: w,
            height: 45,
            child: ElevatedButton(
                style: borderButtonStyle,
                onPressed: () {},
                child: BodyText(
                  text: item.text,
                  textColor: blueColor,
                  fontWeight: FontWeight.w500,
                )),
          );
  }

  static void onChanged(BuildContext context, SubMenuItem item) {
    switch (item) {
      case SubMenuItems.home:
        GoRouter.of(context).go('/');
        break;
      case SubMenuItems.properties:
        GoRouter.of(context).go('/properties');
        break;
      case SubMenuItems.about:
        GoRouter.of(context).go('/about');
        break;
    }
  }
}
