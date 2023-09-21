// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:reluxe_website/constants.dart';

import '../custom_widgets/custom_text.dart';
import '../navbar.dart';
import '../responsive.dart';

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
              Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ReservationProcess(),
                  SizedBox(),
                  //Expanded(flex: 1, child: ReservationProcess())
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

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
            Heading3(
              text: 'Rental Type',
              fontWeight: FontWeight.w500,
            ),
          ],
        )),
    Step(
        title: SizedBox(),
        content: Column(
          children: [
            Heading3(
              text: 'Personal Information',
              fontWeight: FontWeight.w500,
            ),
          ],
        )),
    Step(
        title: SizedBox(),
        content: Column(
          children: [
            Heading3(
              text: 'Payment',
              fontWeight: FontWeight.w500,
            ),
          ],
        )),
  ];

  List<bool> stepCompleted = List.generate(3, (index) => false);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;

    return SizedBox(
        width: 500,
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
                            ? 'Confirm'
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

class ReservationDetails extends StatelessWidget {
  const ReservationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
