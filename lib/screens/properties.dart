// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reluxe_website/constants.dart';
import 'package:reluxe_website/custom_widgets/custom_text.dart';

import '../navbar.dart';
import '../responsive.dart';

class PropertiesPage extends StatefulWidget {
  const PropertiesPage({super.key});

  @override
  State<PropertiesPage> createState() => _PropertiesPageState();
}

class _PropertiesPageState extends State<PropertiesPage> {
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
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.isDesktop(context) ? 60 : 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 400, child: SearchBar()),
                      SizedBox(width: 15),
                      DropdownField(hintText: 'Guests'),
                      SizedBox(width: 15),
                      DropdownField(hintText: 'Per night'),
                      SizedBox(width: 15),
                      SizedBox(
                        height: 55,
                        child: ElevatedButton(
                          style: thinBorderButtonStyle,
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: BodyText(text: 'Filters'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  PropertyTypeIconContainer(),
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

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search a location or property type',
        hintStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey, // Change the border color when focused
              width: 1.0, // Adjust the border width when focused
            ),
            borderRadius: BorderRadius.all(Radius.circular(8.0))),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey, // Change the border color when focused
            width: 1.0, // Adjust the border width when focused
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class DropdownField extends StatefulWidget {
  final String hintText;
  const DropdownField({super.key, required this.hintText});

  @override
  State<DropdownField> createState() => _DropdownFieldState();
}

class _DropdownFieldState extends State<DropdownField> {
  @override
  Widget build(BuildContext context) {
    final List<String> items = [
      'Item1',
      'Item2',
      'Item3',
      'Item4',
      'Item5',
      'Item6',
      'Item7',
      'Item8',
    ];
    String? selectedValue;

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: BodyText(text: widget.hintText),
        items: items
            .map((String item) => DropdownMenuItem<String>(
                  value: item,
                  child: BodyText(text: item),
                ))
            .toList(),
        value: selectedValue,
        onChanged: (value) {
          setState(() {
            selectedValue = value;
          });
        },
        buttonStyleData: ButtonStyleData(
          height: 56,
          width: 160,
          padding: const EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.grey,
            ),
            color: Colors.white,
          ),
        ),
        iconStyleData: const IconStyleData(
          icon: Icon(
            Icons.arrow_drop_down,
          ),
          iconSize: 30,
          iconEnabledColor: Colors.grey,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 500,
          width: 250,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
          ),
          offset: const Offset(0, -5),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(3),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 40,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }
}

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
  const PropertyTypeIconContainer({super.key});

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

  @override
  Widget build(BuildContext context) {
    return !Responsive.isDesktop(context)
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
                    onPressed: () => handleItemSelection(index),
                    height: 55,
                    isSelected: selectedIndex == index,
                  ),
                ),
              ),
            ),
          )
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
          );
  }
}
