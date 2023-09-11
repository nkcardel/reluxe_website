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
      appBar: AppBar(
        toolbarHeight: 80.0,
        elevation: 4,
        titleSpacing: 0,
        title: NavBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isDesktop(context) ? 60 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60),
              HomeContainer(),
              SizedBox(height: 30),
              PropertyTypeContainer(),
              SizedBox(height: 30),
              BodyText(text: 'Recommended'),
              SizedBox(height: 10),
              PropertyItemsContainer(),
            ],
          ),
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
        ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Image.asset('assets/property.jpeg', width: w / 2.5),
        ),
      ],
    );
  }
}

class PropertyContainer extends StatelessWidget {
  final String text;
  final String image;
  final double width;
  final double height;
  final Color textboxColor;
  final Color textColor;
  final FontWeight fontWeight;
  const PropertyContainer({
    super.key,
    required this.text,
    this.image = 'assets/condo.png',
    required this.width,
    required this.height,
    required this.textboxColor,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.all(8.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              image,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.withOpacity(0.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: textboxColor,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                  child: BodyText(
                    text: text,
                    textColor: textColor,
                    fontWeight: fontWeight,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyTypeContainer extends StatelessWidget {
  const PropertyTypeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> propertyName = [
      'Apartment',
      'Bedspacer',
      'Condominium',
      'House',
      'Townhouse',
      'Vacation House'
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          propertyName.length,
          (index) => PropertyContainer(
            width: 200,
            height: 200,
            text: propertyName[index],
            textboxColor: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}

class PropertyItemsContainer extends StatelessWidget {
  const PropertyItemsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    int containersPerRow = Responsive.isDesktop(context)
        ? 4
        : Responsive.isTablet(context)
            ? 2
            : 1;

    double containerSize = containersPerRow == 4 ? 100.0 : 30.0;

    return SingleChildScrollView(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: containersPerRow,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return PropertyContainer(
            height: containerSize,
            width: containerSize,
            text: 'Property Name',
            textboxColor: Colors.white.withOpacity(0.7),
            textColor: Colors.black,
            fontWeight: FontWeight.w500,
          );
        },
      ),
    );
  }
}
