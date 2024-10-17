import 'package:flutter/material.dart';
import 'package:yourpadel/presentation_layer/resources/icons_app.dart';
import 'package:yourpadel/presentation_layer/resources/routes.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ReservationScreen extends StatefulWidget {
  @override
  _ReservationScreenState createState() => _ReservationScreenState();
}

class _ReservationScreenState extends State<ReservationScreen> {
  String userImage = "";
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  String selectedCourt = 'Court 1';

  Future<void> getLocation(String lat, String long) async {
    String googleURL =
        "https://www.google.com/maps/search/?api=1&query=$lat,$long";
    await canLaunch(googleURL)
        ? await launch(googleURL)
        : throw "Could not launch $googleURL";
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  void _confirmReservation() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Text(
              "Reservation confirmed for $selectedCourt on $selectedDate at $selectedTime"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Share.share(
                    "Your padel reservation: $selectedCourt on $selectedDate at $selectedTime");
              },
              child: Text('Share'),
            ),
            TextButton(
              onPressed: () {
                getLocation("28.2315451796503", "33.64648818969727");
              },
              child: Text('Get Location'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.6),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 177.0),
                  child: Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: userImage != ""
                              ? NetworkImage(userImage)
                              : AssetImage('assets/images/default_img.png')
                                  as ImageProvider,
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Welcome to Your Padel',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        // Additional Welcome Text
                        SizedBox(height: 8), // spacing
                        Text(
                          'Enjoy your time on the court!',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // Reservation Title
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Make a Reservation',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // DateTime Picker and Court Selector
                ReservationForm(
                  selectedDate: selectedDate,
                  onDateChanged: (date) {
                    setState(() {
                      selectedDate = date;
                    });
                  },
                  selectedTime: selectedTime,
                  onTimeChanged: (time) {
                    setState(() {
                      selectedTime = time;
                    });
                  },
                  selectedCourt: selectedCourt,
                  onCourtChanged: (court) {
                    setState(() {
                      selectedCourt = court ?? 'Court 1';
                    });
                  },
                ),
                SizedBox(height: 40),
                // Confirm Reservation Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ElevatedButton(
                    onPressed: _confirmReservation,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(195, 253, 8, 1),
                      padding: EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'Confirm Reservation',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReservationForm extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateChanged;
  final TimeOfDay selectedTime;
  final ValueChanged<TimeOfDay> onTimeChanged;
  final String selectedCourt;
  final ValueChanged<String?> onCourtChanged;

  ReservationForm({
    required this.selectedDate,
    required this.onDateChanged,
    required this.selectedTime,
    required this.onTimeChanged,
    required this.selectedCourt,
    required this.onCourtChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Date Picker
        ListTile(
          title: Text(
            'Select Date',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          trailing: TextButton(
            onPressed: () => _selectDate(context),
            child: Text(
              '${selectedDate.toLocal()}'.split(' ')[0],
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        // Time Picker
        ListTile(
          title: Text(
            'Select Time',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          trailing: TextButton(
            onPressed: () => _selectTime(context),
            child: Text(
              selectedTime.format(context),
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        // Court Dropdown
        ListTile(
          title: Text(
            'Select Court',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          trailing: DropdownButton<String>(
            value: selectedCourt,
            dropdownColor: Colors.black87,
            iconEnabledColor: Colors.white,
            onChanged: onCourtChanged,
            items: ['Court 1', 'Court 2', 'Court 3', 'Court 4']
                .map((court) => DropdownMenuItem(
                      value: court,
                      child: Text(court, style: TextStyle(color: Colors.white)),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 30)),
    );

    if (picked != null) {
      onDateChanged(picked);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (picked != null) {
      onTimeChanged(picked);
    }
  }
}
