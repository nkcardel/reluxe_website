// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:reluxe_website/constants.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../custom_widgets/custom_text.dart';
import '../navbar.dart';
import '../responsive.dart';
import '../reusables/propertyType_containers.dart';
import '../reusables/star_rating.dart';

class ReserveProperty extends StatefulWidget {
  const ReserveProperty({super.key});

  @override
  State<ReserveProperty> createState() => _ReservePropertyState();
}

class _ReservePropertyState extends State<ReserveProperty> {
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
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Responsive.isDesktop(context) ? 60 : 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40),
              Align(
                alignment: Alignment.center,
                child: Heading3(
                  text: 'Reserve',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 30),
              Responsive.isDesktop(context)
                  ? Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child:
                                Expanded(flex: 4, child: ReservationProcess()),
                          ),
                          SizedBox(width: 70),
                          Expanded(flex: 4, child: ReservationDetails())
                        ],
                      ),
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ReservationProcess(),
                        ReservationDetails(),
                      ],
                    )
            ],
          ),
        ),
      ),
    );
  }
}

// ============= Reservation Process =============
class ReservationProcess extends StatefulWidget {
  const ReservationProcess({super.key});

  @override
  State<ReservationProcess> createState() => _ReservationProcessState();
}

class _ReservationProcessState extends State<ReservationProcess> {
  int _currentStep = 0;

  List<Step> steps = [
    Step(
        title: SizedBox(),
        content: Column(
          children: [
            BodyText(
              text: 'Rental Type',
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 20),
            RentalType(),
            SizedBox(height: 40),
          ],
        )),
    Step(
        title: SizedBox(),
        content: Column(
          children: [
            BodyText(
              text: 'Personal Information',
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 20),
            PersonalInformation(),
            SizedBox(height: 40),
          ],
        )),
    Step(
        title: SizedBox(),
        content: Column(
          children: [
            BodyText(
              text: 'Payment',
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: 20),
            Payment(),
            SizedBox(height: 40),
          ],
        )),
  ];

  List<bool> stepCompleted = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return SizedBox(
        width: Responsive.isDesktop(context) ? 500 : w,
        height: h,
        child: Stepper(
          type: StepperType.horizontal,
          elevation: 0,
          currentStep: _currentStep,
          steps: steps.map((Step step) {
            int index = steps.indexOf(step);
            return Step(
              title: step.title,
              content: step.content,
              state: stepCompleted[index] == true
                  ? StepState.complete
                  : StepState.indexed,
            );
          }).toList(),
          onStepTapped: (step) {
            setState(() {
              _currentStep = step;
            });
          },
          controlsBuilder: (BuildContext context, ControlsDetails details) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Visibility(
                  visible: _currentStep != 0,
                  child: Expanded(
                    child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: borderButtonStyle,
                        onPressed: () => setState(() {
                          _currentStep > 0 ? _currentStep -= 1 : null;
                          if (_currentStep >= 0) {
                            setState(() {
                              stepCompleted[_currentStep] = false;
                            });
                          }
                        }),
                        child: BodyText(
                          text: 'Back',
                          textColor: blueColor,
                        ),
                      ),
                    ),
                  ),
                ),
                Visibility(
                    visible: _currentStep != 0, child: SizedBox(width: 15)),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: filledButtonStyle,
                      onPressed: () => setState(() {
                        if (_currentStep < steps.length - 1) {
                          setState(() {
                            stepCompleted[_currentStep] =
                                true; // Mark step as completed
                            _currentStep += 1;
                          });
                        }
                      }),
                      child: BodyText(
                        text: _currentStep == steps.length - 1
                            ? 'Pay now'
                            : 'Next',
                        textColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}

// ============= Reservation Process > Rental Type =============
class RentalType extends StatefulWidget {
  const RentalType({super.key});

  @override
  State<RentalType> createState() => _RentalTypeState();
}

class _RentalTypeState extends State<RentalType> {
  List<String> rentalType = ['Daily', 'Monthly', 'Yearly'];
  List<bool> selectedRentalType = [true, false, false];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        ToggleButtons(
            onPressed: (int index) {
              setState(() {
                // The button that is tapped is set to true, and the others to false.
                for (int i = 0; i < selectedRentalType.length; i++) {
                  selectedRentalType[i] = i == index;
                }
              });
            },
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            selectedBorderColor: blueColor,
            selectedColor: Colors.white,
            fillColor: blueColor,
            color: Colors.black,
            constraints: BoxConstraints(
              minHeight: 45,
              minWidth: Responsive.isDesktop(context) ? 500 / 3.5 : w / 4,
            ),
            isSelected: selectedRentalType,
            children: List.generate(
                rentalType.length,
                (index) => BodyText(
                      text: rentalType[index],
                      textColor: selectedRentalType[index] == true
                          ? Colors.white
                          : Colors.black,
                    ))),
        SizedBox(height: 40),
        Visibility(
            visible: selectedRentalType[0] == true, child: DailyCalendar()),
        Visibility(
            visible: selectedRentalType[1] == true, child: MonthlyCalendar()),
        Visibility(
            visible: selectedRentalType[2] == true, child: YearlyCalendar()),
      ],
    );
  }
}

// ============= Reservation Process > Rental Type > Daily Calendar =============
class DailyCalendar extends StatelessWidget {
  const DailyCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SfDateRangePicker(
            view: DateRangePickerView.month,
            selectionMode: DateRangePickerSelectionMode.range,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              //final dynamic value = args.value;
              debugPrint('Selected dates: ${args.value}');
            },
            onViewChanged: (DateRangePickerViewChangedArgs args) {
              // final PickerDateRange visibleDates = args.visibleDateRange;
              // final DateRangePickerView view = args.view;
              debugPrint('Selected dates: ${args.visibleDateRange}');
            },
            allowViewNavigation: true,
            selectionColor: Colors.grey.shade400,
            enablePastDates: false,
            toggleDaySelection: true,
            initialSelectedDate: DateTime.now(),
            minDate: DateTime.now(),
            selectionTextStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            todayHighlightColor: blueColor,
            initialDisplayDate: DateTime.now(),
            startRangeSelectionColor: blueColor,
            endRangeSelectionColor: blueColor,
            rangeSelectionColor: blueColor.withOpacity(0.1),
            rangeTextStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
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
    );
  }
}

// ============= Reservation Process > Rental Type > Monthly Calendar =============
class MonthlyCalendar extends StatelessWidget {
  const MonthlyCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SfDateRangePicker(
            view: DateRangePickerView.year,
            selectionMode: DateRangePickerSelectionMode.range,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              //final dynamic value = args.value;
              debugPrint('Selected dates: ${args.value}');
            },
            onViewChanged: (DateRangePickerViewChangedArgs args) {
              // final PickerDateRange visibleDates = args.visibleDateRange;
              // final DateRangePickerView view = args.view;
              debugPrint('Selected dates: ${args.visibleDateRange}');
            },
            allowViewNavigation: false,
            selectionColor: Colors.grey.shade400,
            enablePastDates: false,
            toggleDaySelection: true,
            initialSelectedDate: DateTime.now(),
            minDate: DateTime.now(),
            selectionTextStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            todayHighlightColor: blueColor,
            initialDisplayDate: DateTime.now(),
            startRangeSelectionColor: blueColor,
            endRangeSelectionColor: blueColor,
            rangeSelectionColor: blueColor.withOpacity(0.1),
            rangeTextStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
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
    );
  }
}

// ============= Reservation Process > Rental Type > Yearly Calendar =============
class YearlyCalendar extends StatelessWidget {
  const YearlyCalendar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SfDateRangePicker(
            view: DateRangePickerView.decade,
            selectionMode: DateRangePickerSelectionMode.range,
            onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
              //final dynamic value = args.value;
              debugPrint('Selected dates: ${args.value}');
            },
            onViewChanged: (DateRangePickerViewChangedArgs args) {
              // final PickerDateRange visibleDates = args.visibleDateRange;
              // final DateRangePickerView view = args.view;
              debugPrint('Selected dates: ${args.visibleDateRange}');
            },
            allowViewNavigation: false,
            selectionColor: Colors.grey.shade400,
            enablePastDates: false,
            toggleDaySelection: true,
            initialSelectedDate: DateTime.now(),
            minDate: DateTime.now(),
            selectionTextStyle:
                TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
            todayHighlightColor: blueColor,
            initialDisplayDate: DateTime.now(),
            startRangeSelectionColor: blueColor,
            endRangeSelectionColor: blueColor,
            rangeSelectionColor: blueColor.withOpacity(0.1),
            rangeTextStyle:
                TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
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
    );
  }
}

// ============= Reservation Process > Personal Information =============
class PersonalInformation extends StatelessWidget {
  const PersonalInformation({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();
    TextEditingController emailAddController = TextEditingController();
    TextEditingController mobileNumController = TextEditingController();
    return Column(
      children: [
        TextField(
          hintText: 'First Name',
          textController: firstNameController,
        ),
        SizedBox(height: 20),
        TextField(
          hintText: 'Last Name',
          textController: lastNameController,
        ),
        SizedBox(height: 20),
        TextField(
          hintText: 'Email Address',
          textController: emailAddController,
        ),
        SizedBox(height: 20),
        TextField(
          hintText: 'Mobile Number',
          textController: mobileNumController,
        ),
        SizedBox(height: 20),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: IncrementalFields(
              texts: ['Infants', 'Children', 'Adults', 'Pets'],
            ),
          ),
        ),
      ],
    );
  }
}

class TextField extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  const TextField(
      {super.key, required this.textController, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.normal,
        ),
        labelStyle: TextStyle(
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
            color: blueColor, // Change the border color when focused
            width: 1.0, // Adjust the border width when focused
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

class IncrementalFields extends StatefulWidget {
  final List<String> texts;
  const IncrementalFields({super.key, required this.texts});

  @override
  State<IncrementalFields> createState() => _IncrementalFieldsState();
}

class _IncrementalFieldsState extends State<IncrementalFields> {
  late List<int> values;

  @override
  void initState() {
    super.initState();
    // Initialize the values list with initial values of 1.
    values = List.generate(widget.texts.length, (index) => 1);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey.shade300,
        thickness: 1,
      ),
      itemCount: widget.texts.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BodyText(text: widget.texts[index]),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      if (values[index] > 1) {
                        setState(() {
                          values[index] -= 1;
                        });
                      }
                    },
                    icon: Icon(
                      Icons.remove_circle_outline_outlined,
                      color: blueColor,
                      size: 28,
                    ),
                  ),
                  SizedBox(width: 5),
                  Heading3(
                    text: values[index].toString(),
                    fontWeight: FontWeight.w500,
                  ),
                  SizedBox(width: 5),
                  IconButton(
                      onPressed: () {
                        if (values[index] <= 10) {
                          setState(() {
                            values[index] += 1;
                          });
                        }
                      },
                      icon: Icon(
                        Icons.add_circle_outline_rounded,
                        color: blueColor,
                        size: 28,
                      )),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

// ============= Reservation Process > Payment =============
class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  List<String> paymentType = ['Partial', 'Full'];
  List<bool> selectedPaymentType = [true, false];

  List<String> paymentMethod = ['Cash', 'GCash', 'Maya', 'Paypal', 'Card'];
  List<bool> selectedPaymentMethod = [false, false, false, false, false];
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: BodyText(
            text: 'Choose a payment type',
          ),
        ),
        SizedBox(height: 15),
        ToggleButtons(
            onPressed: (int index) {
              setState(() {
                // The button that is tapped is set to true, and the others to false.
                for (int i = 0; i < selectedPaymentType.length; i++) {
                  selectedPaymentType[i] = i == index;
                }
              });
            },
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            selectedBorderColor: blueColor,
            selectedColor: Colors.white,
            fillColor: blueColor,
            color: Colors.black,
            constraints: BoxConstraints(
              minHeight: 45,
              minWidth: Responsive.isDesktop(context) ? 500 / 2.5 : w / 3,
            ),
            isSelected: selectedPaymentType,
            children: List.generate(
                paymentType.length,
                (index) => BodyText(
                      text: paymentType[index],
                      textColor: selectedPaymentType[index] == true
                          ? Colors.white
                          : Colors.black,
                    ))),
        SizedBox(height: 40),
        Align(
          alignment: Alignment.centerLeft,
          child: BodyText(
            text: 'Choose a payment method',
          ),
        ),
        SizedBox(height: 15),
        ToggleButtons(
            direction: Axis.vertical,
            onPressed: (int index) {
              setState(() {
                for (int i = 0; i < selectedPaymentMethod.length; i++) {
                  selectedPaymentMethod[i] = i == index;
                }
              });
            },
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            selectedBorderColor: blueColor,
            selectedColor: Colors.white,
            fillColor: blueColor,
            color: Colors.black,
            constraints: BoxConstraints(
              minHeight: 45,
              minWidth: Responsive.isDesktop(context) ? w : w,
            ),
            isSelected: selectedPaymentMethod,
            children: List.generate(
                paymentMethod.length,
                (index) => BodyText(
                      text: paymentMethod[index],
                      textColor: selectedPaymentMethod[index] == true
                          ? Colors.white
                          : Colors.black,
                    ))),
      ],
    );
  }
}

// ============= Reservation Details =============
class ReservationDetails extends StatelessWidget {
  const ReservationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PropertyContainer(
                  image: 'assets/condo.png',
                  width: 200,
                  height: 200,
                  text: 'Condominium',
                  textboxColor: Colors.black.withOpacity(0.5),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: w / 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Heading3(
                        text:
                            'Modern Luxury Apartment for Rent: A Cozy Home in the Heart of the City',
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 5),
                      BodyText(
                        text:
                            '123 Sunshine Street City Heights Subdivision, Metro Manila, Philippines',
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Image.asset(
                          'assets/host.png',
                          fit: BoxFit.cover,
                          height: 30,
                        ),
                      ),
                      SizedBox(width: 15),
                      BodyText(text: 'Jane Doe'),
                    ],
                  ),
                  Row(
                    children: [
                      StarRating(
                        rating: 3.5,
                      ),
                      SizedBox(width: 5),
                      BodyText(text: '3.5'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
