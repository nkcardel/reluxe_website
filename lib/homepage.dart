// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:reluxe_website/constants.dart';
import 'package:reluxe_website/custom_widgets/custom_text.dart';
import 'package:reluxe_website/navbar.dart';
import 'package:reluxe_website/responsive.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          NavBar(),
          SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.isDesktop(context) ? 40 : 20),
            child: HomeContainer(),
          ),
        ],
      ),
    );
  }
}

class HomeContainer extends StatelessWidget {
  const HomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          width: w / 2.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Heading1(
                text: "Elevate Your Rental Experience with Reluxe",
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 10),
              BodyText(
                text:
                    "Discover a world of luxury and elegance with Reluxe. We offer a curated selection of exceptional rental properties, meticulously handpicked to provide you with an unforgettable living experience. Whether you're seeking a stylish city apartment, a serene beachfront villa, or a charming countryside retreat, Reluxe has the perfect rental property to suit your desires.",
                textColor: Colors.black,
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: filledButtonStyle,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: BodyText(
                        text: "Rent a property",
                        textColor: Colors.white,
                        fontWeight: FontWeight.normal,
                        //letterSpacing: selected ? 0.5 : 0,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    style: borderButtonStyle,
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: BodyText(
                        text: "Post a listing",
                        textColor: blueColor,
                        fontWeight: FontWeight.normal,
                        //letterSpacing: selected ? 0.5 : 0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
