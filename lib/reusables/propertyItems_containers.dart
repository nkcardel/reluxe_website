// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../custom_widgets/custom_text.dart';
import '../responsive.dart';
import 'propertyType_containers.dart';

class PropertyItemsContainer extends StatefulWidget {
  final String propertyType;
  const PropertyItemsContainer(
      {super.key, this.propertyType = "Property Type"});

  @override
  State<PropertyItemsContainer> createState() => _PropertyItemsContainerState();
}

class _PropertyItemsContainerState extends State<PropertyItemsContainer> {
  List<bool> isHeartSelectedList = List.generate(20, (index) => false);
  @override
  Widget build(BuildContext context) {
    int containersPerRow = Responsive.isDesktop(context)
        ? 4
        : Responsive.isTablet(context)
            ? 2
            : 1;

    // double containerSize = containersPerRow == 4 ? 100.0 : 30.0;

    return SingleChildScrollView(
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: containersPerRow,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
        ),
        itemCount: 20,
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Expanded(
                child: PropertyContainer(
                  image: 'assets/interior.jpeg',
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  text: widget.propertyType,
                  textboxColor: Colors.white.withOpacity(0.7),
                  textColor: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BodyText(
                          text: 'Manila, Philippines',
                          fontWeight: FontWeight.w500,
                        ),
                        BodyText(text: 'by Jane Doe'),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.bed_rounded,
                                  weight: 0.01,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                BodyText(text: '1 bed/s'),
                              ],
                            ),
                            SizedBox(width: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.bathtub_outlined,
                                  weight: 0.01,
                                  color: Colors.black.withOpacity(0.7),
                                ),
                                BodyText(text: '1 bath/s'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        RichText(
                          text: TextSpan(children: <TextSpan>[
                            TextSpan(
                              text: 'PHP 1,263',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' / night',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ]),
                        ),
                        SizedBox(height: 10),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isHeartSelectedList[index] =
                              !isHeartSelectedList[index];
                        });
                      },
                      child: Icon(
                        isHeartSelectedList[index]
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: isHeartSelectedList[index]
                            ? Colors.red
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
