// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:reluxe_website/constants.dart';

import '../custom_widgets/custom_text.dart';
import '../navbar.dart';
import '../responsive.dart';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    List<String> advantagesTitle = [
      'Curated Collection',
      'Personalized Service',
      'Unparalleled Elegance',
    ];
    List<String> advantagesDesc = [
      'Reluxe offers a handpicked selection of exquisite rental properties for an exceptional living experience.',
      'Our dedicated team provides tailored recommendations and attentive assistance to match your unique preferences.',
      'Each property exudes sophistication and style, delivering a luxurious stay like no other.',
    ];

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Responsive.isDesktop(context) ? 80 : 65,
        elevation: 4,
        titleSpacing: 0,
        title: NavBar(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  'assets/property.jpeg',
                  width: w,
                  height: Responsive.isDesktop(context) ? 700 : 500,
                  fit: BoxFit.cover,
                ),
                Container(
                  width: w,
                  height: Responsive.isDesktop(context) ? 700 : 500,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: Responsive.isDesktop(context)
                          ? w / 4
                          : Responsive.isTablet(context)
                              ? w / 10
                              : 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Responsive.isDesktop(context)
                          ? Heading1(
                              text:
                                  "Reluxe: Redefining Extraordinary Property Rentals",
                              fontWeight: FontWeight.w500,
                              textColor: Colors.white,
                              textAlign: TextAlign.center,
                            )
                          : Heading2(
                              text:
                                  "Reluxe: Redefining Extraordinary Property Rentals",
                              fontWeight: FontWeight.w500,
                              textColor: Colors.white,
                              textAlign: TextAlign.center,
                            ),
                      SizedBox(height: 10),
                      BodyText(
                        text:
                            "Welcome to Reluxe, where luxury meets convenience in the world of property rentals. At Reluxe, we believe that your living experience should be nothing short of exceptional, and our mission is to curate a handpicked selection of the most exquisite rental properties to elevate your lifestyle.",
                        textColor: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.isDesktop(context) ? 60 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Responsive.isDesktop(context)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: w / 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Heading3(
                                    text: 'Our Journey',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(height: 10),
                                  BodyText(
                                    text:
                                        'Reluxe was born from a desire to provide a seamless and delightful rental journey for discerning individuals like you. With a team of dedicated experts in the real estate industry, we embarked on a mission to handpick the most exquisite properties from around the globe. Each property in our collection reflects our commitment to exceptional design, top-tier amenities, and breathtaking locations.',
                                  ),
                                  SizedBox(height: 30),
                                  Heading3(
                                    text: 'Discover Your Sanctuary',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  BodyText(
                                    text:
                                        'Our carefully curated collection spans a diverse range of settings, from luxurious urban retreats to idyllic coastal getaways and peaceful countryside estates. Whether you are searching for a lavish penthouse or a serene villa, our properties promise to elevate your lifestyle and create cherished memories.',
                                  )
                                ],
                              ),
                            ),
                            PhotoGrid(),
                          ],
                        )
                      : Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50.0),
                              child: Column(
                                children: [
                                  Heading3(
                                    text: 'Our Journey',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(height: 10),
                                  BodyText(
                                    text:
                                        'Reluxe was born from a desire to provide a seamless and delightful rental journey for discerning individuals like you. With a team of dedicated experts in the real estate industry, we embarked on a mission to handpick the most exquisite properties from around the globe. Each property in our collection reflects our commitment to exceptional design, top-tier amenities, and breathtaking locations.',
                                  ),
                                  SizedBox(height: 30),
                                  Heading3(
                                    text: 'Discover Your Sanctuary',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(height: 10),
                                  BodyText(
                                    text:
                                        'Our carefully curated collection spans a diverse range of settings, from luxurious urban retreats to idyllic coastal getaways and peaceful countryside estates. Whether you are searching for a lavish penthouse or a serene villa, our properties promise to elevate your lifestyle and create cherished memories.',
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 50),
                            PhotoGrid(),
                          ],
                        ),
                  SizedBox(height: 70),
                  Align(
                    alignment: Alignment.center,
                    child: Heading3(
                      text: 'Why Choose Reluxe',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 50),
                  Responsive.isDesktop(context)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (index) => Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Stack(
                                alignment: AlignmentDirectional.topCenter,
                                clipBehavior: Clip.none,
                                children: [
                                  Container(
                                    width: w / 4,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.grey.shade300,
                                        width: 1.5,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(height: 55),
                                          Heading3(
                                            text: advantagesTitle[index],
                                            fontWeight: FontWeight.w500,
                                            textAlign: TextAlign.center,
                                          ),
                                          SizedBox(height: 10),
                                          BodyText(
                                            text: advantagesDesc[index],
                                          ),
                                          SizedBox(height: 30),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: -20,
                                    child: Container(
                                      width: 45,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: blueColor,
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Heading3(
                                          text: '${index + 1}',
                                          fontWeight: FontWeight.w500,
                                          textColor: Colors.white,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                      : Column(
                          children: List.generate(
                            3,
                            (index) => Center(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 30),
                                child: Stack(
                                  alignment: AlignmentDirectional.topCenter,
                                  clipBehavior: Clip.none,
                                  children: [
                                    Container(
                                      width: Responsive.isTablet(context)
                                          ? w / 4
                                          : w / 2,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey.shade300,
                                          width: 1.5,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 55),
                                            Heading3(
                                              text: advantagesTitle[index],
                                              fontWeight: FontWeight.w500,
                                              textAlign: TextAlign.center,
                                            ),
                                            SizedBox(height: 10),
                                            BodyText(
                                              text: advantagesDesc[index],
                                            ),
                                            SizedBox(height: 30),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      top: -20,
                                      child: Container(
                                        width: 45,
                                        height: 45,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: blueColor,
                                        ),
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Heading3(
                                            text: '${index + 1}',
                                            fontWeight: FontWeight.w500,
                                            textColor: Colors.white,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                  SizedBox(height: 70),
                  Responsive.isDesktop(context)
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            PhotoGrid(),
                            SizedBox(width: 100),
                            SizedBox(
                              width: w / 3,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Heading3(
                                    text: 'Experience the Reluxe Difference',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(height: 10),
                                  BodyText(
                                    text:
                                        'We invite you to embark on a journey of refined living with Reluxe. Whether you are planning a vacation, relocation, or a temporary escape, let us be your trusted companion in finding your perfect sanctuary. Indulge in the art of luxurious living and unlock a world of elegance, comfort, and sophistication with Reluxe. Welcome to the realm of extraordinary property rentals – welcome to Reluxe.',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            PhotoGrid(),
                            SizedBox(height: 50),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50.0),
                              child: Column(
                                children: [
                                  Heading3(
                                    text: 'Experience the Reluxe Difference',
                                    fontWeight: FontWeight.w500,
                                  ),
                                  SizedBox(height: 10),
                                  BodyText(
                                    text:
                                        'We invite you to embark on a journey of refined living with Reluxe. Whether you are planning a vacation, relocation, or a temporary escape, let us be your trusted companion in finding your perfect sanctuary. Indulge in the art of luxurious living and unlock a world of elegance, comfort, and sophistication with Reluxe. Welcome to the realm of extraordinary property rentals – welcome to Reluxe.',
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

class PhotoGrid extends StatelessWidget {
  const PhotoGrid({super.key});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10.0),
            bottomLeft: Radius.circular(10.0),
          ),
          child: Image.asset(
            'assets/property.jpeg',
            width: Responsive.isDesktop(context) ? 200 : w / 4,
            height: Responsive.isDesktop(context)
                ? 400
                : Responsive.isTablet(context)
                    ? 330
                    : 280,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  'assets/property.jpeg',
                  width: Responsive.isDesktop(context) ? 150 : w / 5,
                  height: Responsive.isDesktop(context)
                      ? 195
                      : Responsive.isTablet(context)
                          ? 150
                          : 135,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    'assets/property.jpeg',
                    width: Responsive.isDesktop(context) ? 250 : w / 2.5,
                    height: Responsive.isDesktop(context)
                        ? 195
                        : Responsive.isTablet(context)
                            ? 160
                            : 135,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Image.asset(
                  'assets/property.jpeg',
                  width: Responsive.isDesktop(context) ? 250 : w / 2.5,
                  height: Responsive.isDesktop(context)
                      ? 195
                      : Responsive.isTablet(context)
                          ? 160
                          : 135,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 10),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(10.0),
                  ),
                  child: Image.asset(
                    'assets/property.jpeg',
                    width: Responsive.isDesktop(context) ? 150 : w / 5,
                    height: Responsive.isDesktop(context)
                        ? 195
                        : Responsive.isTablet(context)
                            ? 160
                            : 135,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(width: 10),
      ],
    );
  }
}
