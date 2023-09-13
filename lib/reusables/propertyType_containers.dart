// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:reluxe_website/constants.dart';

import '../custom_widgets/custom_text.dart';
import '../responsive.dart';
import 'propertyItems_containers.dart';

// =================== PROPERTY TYPE "ICON" CONTAINERS ====================
class PropertyIconContainer extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String icon;
  final double height;
  final Color textColor;
  final bool isSelected;
  const PropertyIconContainer(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.icon,
      required this.height,
      this.textColor = Colors.black,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
          style: isSelected ? filledButtonStyle : thinBorderButtonStyle,
          onPressed: () => onPressed(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                icon,
                width: 25,
                height: 25,
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : blueColor,
                  BlendMode
                      .srcIn, // This mode ensures the color is applied correctly
                ),
              ),
              SizedBox(width: 15),
              BodyText(
                text: text,
                textColor: isSelected ? Colors.white : Colors.black,
              ),
            ],
          )),
    );
  }
}

class PropertyTypeIconContainer extends StatefulWidget {
  final bool showUnits;
  const PropertyTypeIconContainer({super.key, this.showUnits = false});

  @override
  State<PropertyTypeIconContainer> createState() =>
      _PropertyTypeIconContainerState();
}

class _PropertyTypeIconContainerState extends State<PropertyTypeIconContainer> {
  List<String> propertyName = [
    'Apartment',
    'Bedspacer',
    'Condominium',
    'House',
    'Townhouse',
    'Vacation House'
  ];

  List<String> propertyIcon = [
    'assets/icons/apartment.svg',
    'assets/icons/bedspacer.svg',
    'assets/icons/condominium.svg',
    'assets/icons/house.svg',
    'assets/icons/townhouse.svg',
    'assets/icons/vacation-house.svg',
  ];

  int selectedIndex = -1; // Initially, no item is selected.

  void handleItemSelection(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  // for scrolling purposes
  /*ScrollController _scrollController = ScrollController();
  bool _showLeftArrow = false;
  bool _showRightArrow = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    setState(() {
      // Check if the user has scrolled to the end
      if (_scrollController.offset >=
          _scrollController.position.maxScrollExtent) {
        _showRightArrow = false;
        _showLeftArrow = true;
      } else if (_scrollController.offset <=
          _scrollController.position.minScrollExtent) {
        // Check if the user is at the beginning
        _showLeftArrow = false;
        _showRightArrow = true;
      } else {
        // User is scrolling, both arrows should be visible
        _showLeftArrow = true;
        _showRightArrow = true;
      }
    });
  }

  void _scrollToLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 100, // Adjust this value for your needs
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToRight() {
    _scrollController.animateTo(
      _scrollController.offset + 100, // Adjust this value for your needs
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          !Responsive.isDesktop(context)
              ? SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      propertyName.length,
                      (index) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PropertyIconContainer(
                          text: propertyName[index],
                          icon: propertyIcon[index],
                          onPressed: () {
                            handleItemSelection(index);
                          },
                          height: 55,
                          isSelected: selectedIndex == index,
                        ),
                      ),
                    ),
                  ),
                )
              /*Row(
                  children: [
                    if (_showLeftArrow)
                      IconButton(
                          onPressed: _scrollToLeft,
                          icon: Icon(
                            Icons.arrow_circle_left_outlined,
                            size: 30,
                            color: blueColor,
                          )),
                    SizedBox(width: 5),
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        controller: _scrollController,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            propertyName.length,
                            (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: PropertyIconContainer(
                                text: propertyName[index],
                                icon: propertyIcon[index],
                                onPressed: () {
                                  handleItemSelection(index);
                                },
                                height: 55,
                                isSelected: selectedIndex == index,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 5),
                    if (_showRightArrow)
                      IconButton(
                          onPressed: _scrollToRight,
                          icon: Icon(
                            Icons.arrow_circle_right_outlined,
                            size: 30,
                            color: blueColor,
                          )),
                  ],
                )*/
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    propertyName.length,
                    (index) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PropertyIconContainer(
                        text: propertyName[index],
                        icon: propertyIcon[index],
                        onPressed: () => handleItemSelection(index),
                        height: 55,
                        isSelected: selectedIndex == index,
                      ),
                    ),
                  ),
                ),
          SizedBox(height: 20),
          widget.showUnits == true
              ? PropertyItemsContainer(
                  propertyType: selectedIndex == 0
                      ? 'Apartment'
                      : selectedIndex == 1
                          ? 'Bedspacer'
                          : selectedIndex == 2
                              ? 'Condominium'
                              : selectedIndex == 3
                                  ? 'House'
                                  : selectedIndex == 4
                                      ? 'Townhouse'
                                      : selectedIndex == 5
                                          ? 'Vacation House'
                                          : 'Property Type')
              : SizedBox(height: 0),
        ],
      ),
    );
  }

  /*@override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }*/
}

// =================== PROPERTY TYPE "IMAGE" CONTAINERS ====================
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
    required this.image,
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
            image: 'assets/condo.png',
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
