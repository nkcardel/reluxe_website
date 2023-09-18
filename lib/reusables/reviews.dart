// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:reluxe_website/custom_widgets/custom_text.dart';
import 'package:reluxe_website/responsive.dart';

import 'star_rating.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  List<String> names = [
    'College Explorer',
    'Young Professional',
    'Campus Explorer',
  ];

  List<double> rating = [5.0, 3.5, 4.0];

  List<String> message = [
    '"As a college student, this dormitory has been an absolute lifesaver! The vibrant atmosphere and friendly co-ed community made my transition to university life so much easier. The study areas are fantastic, and the high-speed Wi-Fi has been a game-changer for my online classes. The location is perfect, close to my university and various shopping centers. I couldn\'t have asked for a better place to call home during my college years."',
    '"This dormitory is not just for students! As a young professional starting my career, I wanted an affordable and convenient place to stay, and this dormitory exceeded my expectations. The communal kitchen is well-equipped, and I\'ve made great friends in the common lounge area. The rooftop garden is a serene escape after a long day at work. Plus, the 24/7 security gives me peace of mind. Highly recommend it to other young professionals like me!"',
    '"I absolutely love the community vibe of this co-ed dormitory! The dormitory management organizes fun events that help everyone connect and socialize. The separate bathrooms for males and females are always clean and well-maintained. The security measures are excellent, and I feel safe at all times. Plus, being close to my university means I can sleep in a little longer before classes. It\'s the perfect place to make unforgettable memories!"',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Column(
        children: List.generate(names.length, (index) {
          return Container(
            // width: w,
            margin: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.5,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: !Responsive.isMobile(context)
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              BodyText(text: names[index]),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  StarRating(
                                    rating: rating[index],
                                  ),
                                  SizedBox(width: 10),
                                  BodyText(
                                      text: rating[index].toStringAsFixed(1))
                                ],
                              )
                            ],
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BodyText(text: names[index]),
                              SizedBox(height: 8),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  StarRating(
                                    rating: rating[index],
                                    size: 18,
                                  ),
                                  SizedBox(width: 5),
                                  BodyText(
                                    text: rating[index].toStringAsFixed(1),
                                    fontSize: 12,
                                  )
                                ],
                              )
                            ],
                          ),
                  ),
                  SizedBox(height: 5),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1,
                  ),
                  SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: BodyText(text: message[index]),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
