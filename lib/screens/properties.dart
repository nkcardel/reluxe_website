// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reluxe_website/constants.dart';
import 'package:reluxe_website/custom_widgets/custom_text.dart';

import '../navbar.dart';
import '../provider/navbar_provider.dart';
import '../responsive.dart';
import '../reusables/propertyType_containers.dart';

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
        toolbarHeight: Responsive.isDesktop(context) ? 80 : 50,
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
                      SizedBox(
                          width: Responsive.isDesktop(context)
                              ? 400
                              : Responsive.isTablet(context)
                                  ? 300
                                  : 200,
                          child: SearchBar()),
                      SizedBox(width: 15),
                      DropdownField(hintText: 'Guests'),
                      SizedBox(width: Responsive.isDesktop(context) ? 15 : 0),
                      Responsive.isDesktop(context)
                          ? DropdownField(hintText: 'Per night')
                          : SizedBox(height: 0),
                      SizedBox(width: 15),
                      SizedBox(
                        height: 55,
                        child: ElevatedButton(
                          style: thinBorderButtonStyle,
                          onPressed: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                vertical:
                                    Responsive.isDesktop(context) ? 8.0 : 0),
                            child: Responsive.isDesktop(context)
                                ? BodyText(text: 'Filters')
                                : Icon(
                                    Icons.filter_list,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
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
          width: Responsive.isDesktop(context) ? 160 : 120,
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isDesktop(context) ? 14 : 10),
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
          maxHeight: Responsive.isDesktop(context) ? 500 : 200,
          width: Responsive.isDesktop(context) ? 250 : 200,
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
