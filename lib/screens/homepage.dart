// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:reluxe_website/constants.dart';
import 'package:reluxe_website/custom_widgets/custom_text.dart';
import 'package:reluxe_website/navbar.dart';
import 'package:reluxe_website/responsive.dart';

import '../provider/navbar_provider.dart';
import '../reusables/propertyItems_containers.dart';
import '../reusables/propertyType_containers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        elevation: 4,
        titleSpacing: 0,
        title: NavBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Responsive.isDesktop(context) ? 60 : 0),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.isDesktop(context) ? 60 : 0),
              child: HomeContainer(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.isDesktop(context) ? 60 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  PropertyTypeContainer(),
                  SizedBox(height: 30),
                  BodyText(
                    text: 'Recommended',
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(height: 10),
                  PropertyItemsContainer(),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ],
        ),
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
    return Responsive.isDesktop(context)
        ? Row(
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
                        SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            style: filledButtonStyle,
                            onPressed: () {
                              final provider = Provider.of<NavBarProvider>(
                                  context,
                                  listen: false);
                              provider.setSelected('Properties');
                              print('isSelected: ${provider.isSelected}');
                              GoRouter.of(context).go("/properties");
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: BodyText(
                                text: "Rent a property",
                                textColor: Colors.white,
                                fontWeight: FontWeight.normal,
                                //letterSpacing: selected ? 0.5 : 0,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        SizedBox(
                          height: 45,
                          child: ElevatedButton(
                            style: borderButtonStyle,
                            onPressed: () {},
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: BodyText(
                                text: "Post a listing",
                                textColor: blueColor,
                                fontWeight: FontWeight.normal,
                                //letterSpacing: selected ? 0.5 : 0,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset('assets/property.jpeg', width: w / 2.5),
              ),
            ],
          )
        : Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                'assets/property.jpeg',
                width: w,
                height: 500,
                fit: BoxFit.cover,
              ),
              Container(
                width: w,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Heading2(
                      text: "Elevate Your Rental Experience with Reluxe",
                      fontWeight: FontWeight.w500,
                      textColor: Colors.white,
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 10),
                    BodyText(
                      text:
                          "Discover a world of luxury and elegance with Reluxe. We offer a curated selection of exceptional rental properties, meticulously handpicked to provide you with an unforgettable living experience. Whether you're seeking a stylish city apartment, a serene beachfront villa, or a charming countryside retreat, Reluxe has the perfect rental property to suit your desires.",
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: whiteFilledButtonStyle,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: BodyText(
                              text: "Rent a property",
                              textColor: blueColor,
                              fontWeight: FontWeight.w500,
                              //letterSpacing: selected ? 0.5 : 0,
                            ),
                          ),
                        ),
                        SizedBox(width: 15),
                        ElevatedButton(
                          style: whiteBorderButtonStyle,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: BodyText(
                              text: "Post a listing",
                              textColor: Colors.white,
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
