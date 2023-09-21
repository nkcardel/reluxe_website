// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reluxe_website/custom_widgets/custom_text.dart';

import '../constants.dart';
import '../navbar.dart';
import '../responsive.dart';
import '../reusables/reviews.dart';
import '../reusables/star_rating.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import 'package:intl/intl.dart';

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
                  SizedBox(height: Responsive.isMobile(context) ? 20 : 40),
                  UnitPhotoGrid(),
                  SizedBox(height: Responsive.isMobile(context) ? 20 : 30),
                  Responsive.isDesktop(context)
                      ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(flex: 4, child: UnitDetails()),
                            SizedBox(width: 60),
                            Expanded(flex: 3, child: UnitAvailability()),
                          ],
                        )
                      : Column(
                          children: [
                            UnitDetails(),
                            SizedBox(height: 10),
                            Divider(
                              color: Colors.grey.shade300,
                              thickness: 1,
                            ),
                            SizedBox(height: 10),
                            UnitAvailability(),
                          ],
                        ),
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

class UnitPhotoGrid extends StatelessWidget {
  const UnitPhotoGrid({super.key});
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double imageHeight = !Responsive.isMobile(context) ? 500 : 350;
    return SizedBox(
      width: w,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Full-size image
          Expanded(
            flex: 1,
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                SizedBox(
                  height: imageHeight,
                  child: ClipRRect(
                    borderRadius: !Responsive.isMobile(context)
                        ? BorderRadius.only(
                            topLeft: Radius.circular(10.0),
                            bottomLeft: Radius.circular(10.0),
                          )
                        : BorderRadius.circular(10),
                    child: Image.asset(
                      'assets/property.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Visibility(
                  visible: Responsive.isMobile(context),
                  child: Positioned(
                    right: 12,
                    bottom: 12,
                    child: SizedBox(
                      child: ElevatedButton(
                        style: fadedWhiteFilledButtonStyle,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.photo_library_outlined,
                              color: Colors.black,
                              size: 20,
                            ),
                            SizedBox(width: 10),
                            BodyText(
                              text: 'Show all photos',
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
              width: !Responsive.isMobile(context)
                  ? 10
                  : 0), // Adjust spacing as needed
          // 2x2 photo grid
          Visibility(
            visible: !Responsive.isMobile(context),
            child: Column(
              children: [
                SizedBox(
                  height: (imageHeight / 2) - 5,
                  child: Image.asset(
                    'assets/property.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10),
                SizedBox(
                  height: (imageHeight / 2) - 5,
                  child: Image.asset(
                    'assets/property.jpeg',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: !Responsive.isMobile(context) ? 10 : 0),
          Visibility(
            visible: !Responsive.isMobile(context),
            child: Column(
              children: [
                SizedBox(
                  height: (imageHeight / 2) - 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10.0),
                    ),
                    child: Image.asset(
                      'assets/property.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    SizedBox(
                      height: (imageHeight / 2) - 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10.0),
                        ),
                        child: Image.asset(
                          'assets/property.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0, bottom: 12),
                      child: SizedBox(
                        height: 40,
                        child: ElevatedButton(
                          style: fadedWhiteFilledButtonStyle,
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.photo_library_outlined,
                                color: Colors.black,
                              ),
                              SizedBox(width: 10),
                              BodyText(
                                text: 'Show all photos',
                                fontWeight: FontWeight.w500,
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UnitDetails extends StatefulWidget {
  const UnitDetails({super.key});

  @override
  State<UnitDetails> createState() => _UnitDetailsState();
}

class _UnitDetailsState extends State<UnitDetails> {
  bool isHeartSelected = false;

  List<String> rentTypeName = [
    'Daily Rent',
    'Monthly Rent',
    'Annual Rent',
  ];

  List<String> rentTypePrice = [
    'PHP 5,000',
    'PHP 80,000',
    'PHP 900,000',
  ];

  List<String> unitDeetsTitle = [
    'Bedroom/s',
    'Bathroom/s',
    'Square Feet',
  ];
  List<String> unitDeets = [
    '2',
    '2',
    '1,500',
  ];

  List<IconData> amenitiesIcon = [
    Icons.flatware_outlined,
    Icons.location_city_outlined,
    Icons.fitness_center_outlined,
    Icons.pool_rounded,
  ];

  List<String> amenitiesName = [
    'Gourmet\nKitchen',
    'City\nView',
    'Fitness\nCenter',
    'Swimming\nPool',
  ];

  List<String> policiesList = [
    'No smoking allowed inside the apartment',
    'No pets allowed',
    'Maximum of 4 occupants',
    'Check-in time: 2:00 PM, Check-out time: 12:00 PM',
  ];

  List<String> feesList = [
    'Security Deposit: ₱10,000 (refundable upon the end of the lease)',
    'Cleaning Fee: ₱1,000 (per stay)',
  ];

  List<IconData> utilitiesIcon = [
    Icons.water_drop_outlined,
    Icons.power_outlined,
  ];

  List<String> utilitiesName = [
    'Water',
    'Electricity',
  ];

  List<String> nearbyPlaces = [
    'XYZ Mall',
    'ABC Plaza',
    'Gourmet Bistro',
    'City Cafe Lounge',
    'City Museum',
    'Bus Stop',
    'Metro Station',
  ];

  List<String> nearbyPlacesDistance = [
    '1.0 km',
    '1.5 km',
    '2.0 km',
    '2.5 km',
    '3.0 km',
    '3.5 km',
    '4.0 km',
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Responsive.isDesktop(context) ? w / 3.5 : w / 1.5,
              child: Heading3(
                text:
                    'Modern Luxury Apartment for Rent: A Cozy Home in the Heart of the City',
                fontWeight: FontWeight.w500,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isHeartSelected = !isHeartSelected;
                });
              },
              child: Icon(
                isHeartSelected ? Icons.favorite : Icons.favorite_border,
                color: isHeartSelected ? Colors.red : Colors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Responsive.isDesktop(context) ? w / 3.5 : w / 1.5,
              child: BodyText(
                text:
                    '123 Sunshine Street City Heights Subdivision, Metro Manila, Philippines',
              ),
            ),
            Responsive.isDesktop(context)
                ? ElevatedButton(
                    style: blackBorderButtonStyle,
                    onPressed: () {},
                    child: BodyText(
                      text: 'Show in maps',
                    ))
                : SizedBox(height: 0),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            StarRating(
              rating: 3.5,
            ),
            SizedBox(width: 5),
            BodyText(text: '3.5'),
          ],
        ),
        SizedBox(height: 20),
        Divider(
          color: Colors.grey.shade300,
          thickness: 1,
        ),
        SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(rentTypeName.length, (index) {
            return Column(
              children: [
                !Responsive.isMobile(context)
                    ? Heading3(
                        text: rentTypePrice[index],
                        fontWeight: FontWeight.w500,
                      )
                    : BodyText(
                        text: rentTypePrice[index],
                        fontWeight: FontWeight.bold,
                      ),
                BodyText(text: rentTypeName[index]),
              ],
            );
          }),
        ),
        SizedBox(height: 30),
        Container(
          height: !Responsive.isMobile(context) ? 120 : 90,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(unitDeets.length, (index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  !Responsive.isMobile(context)
                      ? Heading3(
                          text: unitDeets[index],
                          fontWeight: FontWeight.w500,
                        )
                      : BodyText(
                          text: unitDeets[index],
                          fontWeight: FontWeight.bold,
                        ),
                  BodyText(text: unitDeetsTitle[index]),
                ],
              );
            }),
          ),
        ),
        SizedBox(height: 30),
        Align(
          alignment: Alignment.centerLeft,
          child: BodyText(
            text: 'Description',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        BodyText(
          text:
              'Welcome to our exquisite modern luxury apartment, a haven of elegance and comfort in the vibrant heart of the city. This tastefully designed residence offers a seamless blend of contemporary living and convenience, making it the ideal urban retreat for discerning individuals.\n\nExperience the epitome of city living with our modern luxury apartment. It\'s the perfect urban oasis, surrounded by everything the city has to offer. Book your stay now to enjoy the convenience and luxury of this cozy home in the heart of the city.',
          textAlign: TextAlign.start,
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BodyText(
              text: 'Amenities',
              fontWeight: FontWeight.bold,
            ),
            BodyText(
              text: 'Show all amenities',
              textDecoration: TextDecoration.underline,
              fontSize: !Responsive.isMobile(context) ? 15 : 12,
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
                Responsive.isDesktop(context) ? amenitiesIcon.length : 2,
                (index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    amenitiesIcon[index],
                    size: 30,
                  ),
                  SizedBox(height: 5),
                  BodyText(
                    text: amenitiesName[index],
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }),
          ),
        ),
        SizedBox(height: 30),
        Align(
          alignment: Alignment.centerLeft,
          child: BodyText(
            text: 'Policies',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: List.generate(policiesList.length, (index) {
              return Container(
                width: w,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: BodyText(text: policiesList[index])),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 30),
        Align(
          alignment: Alignment.centerLeft,
          child: BodyText(
            text: 'Fees',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: List.generate(feesList.length, (index) {
              return Container(
                width: w,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: BodyText(text: feesList[index])),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 30),
        Align(
          alignment: Alignment.centerLeft,
          child: BodyText(
            text: 'Utility Inclusions',
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade300,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(utilitiesIcon.length, (index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    utilitiesIcon[index],
                    size: 30,
                  ),
                  SizedBox(height: 5),
                  BodyText(
                    text: utilitiesName[index],
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            }),
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BodyText(
              text: 'Nearby Places',
              fontWeight: FontWeight.bold,
            ),
            BodyText(
              text: 'Show all in map',
              textDecoration: TextDecoration.underline,
              fontSize: !Responsive.isMobile(context) ? 15 : 12,
            ),
          ],
        ),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: List.generate(nearbyPlaces.length, (index) {
              return Container(
                width: w,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey.shade300,
                      width: 1,
                    ),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: w / 3,
                        child: Align(
                            alignment: Alignment.centerLeft,
                            child: BodyText(text: nearbyPlaces[index])),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: BodyText(text: nearbyPlacesDistance[index])),
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BodyText(
              text: 'Reviews',
              fontWeight: FontWeight.bold,
            ),
            BodyText(
              text: 'Show all reviews',
              textDecoration: TextDecoration.underline,
              fontSize: !Responsive.isMobile(context) ? 15 : 12,
            ),
          ],
        ),
        SizedBox(height: 10),
        Reviews(),
      ],
    );
  }
}

class UnitAvailability extends StatefulWidget {
  const UnitAvailability({super.key});

  @override
  State<UnitAvailability> createState() => _UnitAvailabilityState();
}

class _UnitAvailabilityState extends State<UnitAvailability> {
  List<DateTime> initialSelectedDates = [
    DateTime.now(),
    DateTime(2023, 09, 20),
    DateTime(2023, 09, 25),
    DateTime.now().add(const Duration(days: 2)),
    DateTime.now().add(const Duration(days: 10)),
    DateTime.now().add(const Duration(days: 3)),
    DateTime.now().add(const Duration(days: 12)),
    DateTime.now().add(const Duration(days: 23)),
    DateTime.now().add(const Duration(days: 25)),
    DateTime.now().add(const Duration(days: 49)),
  ];

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          // width: w,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade700,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        'assets/host.png',
                        fit: BoxFit.cover,
                        height: 70,
                      ),
                    ),
                    SizedBox(width: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BodyText(text: 'Jane Doe'),
                        BodyText(
                          text: 'Host',
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
                Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.grey.shade600),
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.chat,
                          color: Colors.white,
                          size: 20,
                        ))),
              ],
            ),
          ),
        ),
        SizedBox(height: 30),
        Container(
          // width: w,
          margin: EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey.shade700,
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BodyText(
                  text: 'Availability',
                  fontWeight: FontWeight.w500,
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey.shade300,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SfDateRangePicker(
                      view: DateRangePickerView.month,
                      initialSelectedDates: initialSelectedDates,
                      //onSelectionChanged: _onSelectionChanged,
                      selectionMode: DateRangePickerSelectionMode.range,
                      onSelectionChanged:
                          (DateRangePickerSelectionChangedArgs args) {
                        final dynamic value = args.value;
                        print('Selected dates: ${args.value}');
                      },
                      onViewChanged: (DateRangePickerViewChangedArgs args) {
                        final PickerDateRange visibleDates =
                            args.visibleDateRange;
                        final DateRangePickerView view = args.view;
                        print('Selected dates: ${args.visibleDateRange}');
                      },

                      allowViewNavigation: true,
                      selectionColor: Colors.grey.shade400,
                      enablePastDates: false,
                      toggleDaySelection: true,
                      initialSelectedDate: DateTime.now(),
                      minDate: DateTime.now(),
                      selectionTextStyle: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w500),
                      todayHighlightColor: blueColor,
                      initialDisplayDate: DateTime.now(),
                      startRangeSelectionColor: blueColor,
                      endRangeSelectionColor: blueColor,
                      rangeSelectionColor: blueColor.withOpacity(0.1),
                      rangeTextStyle: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                      selectionShape: DateRangePickerSelectionShape.circle,
                      monthCellStyle: DateRangePickerMonthCellStyle(
                        textStyle: TextStyle(fontSize: 15),
                        todayTextStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      yearCellStyle: DateRangePickerYearCellStyle(
                        todayTextStyle: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      headerStyle: DateRangePickerHeaderStyle(
                          textAlign: TextAlign.center,
                          textStyle: TextStyle(fontSize: 15)),
                      headerHeight: 50,
                      monthViewSettings: DateRangePickerMonthViewSettings(
                        dayFormat: 'E',
                        viewHeaderHeight: 40,
                        viewHeaderStyle: DateRangePickerViewHeaderStyle(
                            textStyle: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          style: filledButtonStyle,
                          onPressed: () => GoRouter.of(context)
                              .go('/properties/unit/reserve-property'),
                          child: BodyText(
                            text: "Reserve",
                            textColor: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          style: borderButtonStyle,
                          onPressed: () {},
                          child: BodyText(
                            text: "Request Tour",
                            textColor: blueColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
