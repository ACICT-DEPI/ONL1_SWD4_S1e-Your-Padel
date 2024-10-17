import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:yourpadel/presentation_layer/resources/icons_app.dart'; // Add this import
import 'package:yourpadel/presentation_layer/resources/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  final user = FirebaseAuth.instance.currentUser!;
  String userImage = ""; // You might want to initialize these variables with appropriate values
  String userFirstName = "";
  String postphoto = "assets/images/postphoto.png";
  String posttitle = "Your Padel";
  String postdescription =
      "Learn from the best specialists in various fields. Subscribe and learn without limits.";
  int counter = 100;
  String formattedDate = DateFormat('MM-dd-yyyy').format(DateTime.now());

  List<PadelBooking> bookings = getMockBookings();

  void _cancelBooking(int index) {
    setState(() {
      bookings.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/background1.2.png',
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
                Positioned(
                  child: Image.asset('assets/images/front_background.png'),
                  top: 0,
                  left: 0,
                ),
                Positioned(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(22, 60, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  ConditionalBuilder(
                                    condition:
                                        userImage != null && userImage != '',
                                    builder: (context) => CircleAvatar(
                                      radius: 22.0,
                                      backgroundImage: NetworkImage(userImage),
                                    ),
                                    fallback: (context) => CircleAvatar(
                                      radius: 22.0,
                                      backgroundColor:
                                          Color.fromRGBO(255, 255, 255, 179),
                                      backgroundImage: AssetImage(
                                          'assets/images/default_img.png'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Welcome ',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              fontSize: (18),
                                              letterSpacing: 0,
                                              color: Color.fromARGB(
                                                  255, 255, 255, 255),
                                            ),
                                          ),
                                          Icon(
                                            Icons_app.hi_icon, // Use IconsApp class
                                            size: 20,
                                            color: Color.fromARGB(
                                                255, 255, 214, 33),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 165,
                                  ),
                                  Row(children: [
                                    InkWell(
                                      onTap: () {
                                        Navigator.pushNamed(
                                          context,
                                          Routes.notficationsRoute,
                                        );
                                      },
                                      child: Icon(
                                        Icons_app.notification_icon, // Use IconsApp class
                                        size: 28,
                                        color: Color.fromRGBO(195, 253, 8, 1),
                                      ),
                                    )
                                  ]),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(37, 126, 0, 0),
                    child: Text(
                      'Reservation',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 190, 0, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(0),
                        topLeft: Radius.circular(0),
                      ),
                      color: Color.fromRGBO(245, 245, 245, 1),
                    ),
                    width: 450,
                    child: Column(
                      children: [
                        ConditionalBuilder(
                          condition: bookings.isNotEmpty, // Check if bookings list is not empty
                          builder: (context) => ListView.builder(
                            shrinkWrap: true,
                            itemCount: bookings.length,
                            itemBuilder: (context, index) {
                              PadelBooking booking = bookings[index];
                              return Card(
                                elevation: 3,
                                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        booking.courtName,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        'Date: ${DateFormat('MM-dd-yyyy').format(booking.bookingDate)}',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 14,
                                        ),
                                      ),
                                      Text(
                                        'Time: ${booking.startTime.hour}:${booking.startTime.minute.toString().padLeft(2, '0')} - ${booking.endTime.hour}:${booking.endTime.minute.toString().padLeft(2, '0')}',
                                        style: TextStyle(
                                          color: Colors.grey[700],
                                          fontSize: 14,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          ElevatedButton(
                                            onPressed: () => _cancelBooking(index),
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.red,
                                            ),
                                            child: Text('Cancel'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                          fallback: (context) => Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'No bookings available',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PadelBooking {
  String courtName;
  DateTime bookingDate;
  DateTime startTime;
  DateTime endTime;

  PadelBooking({
    required this.courtName,
    required this.bookingDate,
    required this.startTime,
    required this.endTime,
  });
}

List<PadelBooking> getMockBookings() {
  return [
    PadelBooking(
      courtName: 'Court 1',
      bookingDate: DateTime(2024, 1, 15),
      startTime: DateTime(2024, 1, 15, 14, 0),
      endTime: DateTime(2024, 1, 15, 16, 0),
    ),
    PadelBooking(
      courtName: 'Court 2',
      bookingDate: DateTime(2024, 2, 20),
      startTime: DateTime(2024, 2, 20, 18, 30),
      endTime: DateTime(2024, 2, 20, 20, 30),
    ),
    // Add more mock bookings as needed
  ];
}
