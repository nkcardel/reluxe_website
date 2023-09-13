// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../navbar.dart';
import '../responsive.dart';

class PropertyUnit extends StatefulWidget {
  const PropertyUnit({super.key});

  @override
  State<PropertyUnit> createState() => _PropertyUnitState();
}

class _PropertyUnitState extends State<PropertyUnit> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Responsive.isDesktop(context) ? 80 : 65,
        elevation: 4,
        titleSpacing: 0,
        title: NavBar(),
        automaticallyImplyLeading: false, //to remove back arrow button
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.isDesktop(context) ? 60 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
