import 'package:flutter/material.dart';

class NotficationScreen extends StatefulWidget {
  @override
  State<NotficationScreen> createState() => _NotficationScreenState();
}

class _NotficationScreenState extends State<NotficationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Stack(
          children: [
            Image.asset('assets/images/background.png', fit: BoxFit.cover, width: double.infinity,),
            Image.asset('assets/images/front_background.png', height: 400, fit: BoxFit.cover,),
            Positioned(
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: CircleAvatar(
                  radius: 20.0,
                  backgroundColor: Color.fromRGBO(255, 255, 255, 0.31),
                  child: Padding(
                    padding: EdgeInsets.only(right: 2.0),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      size: 20.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              top: 47,
              left: 22,
            ),
            Positioned(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(37, 126, 0, 0),
                child: Text(
                  'Notifications',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 178, 0, 0),
              child: SingleChildScrollView(
                child: Container(
                  height: 900,
                  width: 450,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                    color: Color.fromRGBO(255, 255, 255, 1),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          title: Text('Notification 1'),
                          subtitle: Text('Description of Notification 1'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          title: Text('Notification 2'),
                          subtitle: Text('Description of Notification 2'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
