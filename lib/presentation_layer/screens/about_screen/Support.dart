import 'package:flutter/material.dart';

class Support extends StatefulWidget {
  const Support({Key? key}) : super(key: key);

  @override
  _SupportState createState() => _SupportState();
}

class _SupportState extends State<Support> {
  var fromkey = GlobalKey<FormState>();
  String First_Name = "";
  String Last_Name = "";
  String Email = "";
  String massage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/background.png',fit: BoxFit.cover,
                                width: double.infinity,),
                Positioned(
                  child: Image.asset('assets/images/front_background.png'),
                  top: 0,
                  left: 0,
                ),
                Positioned(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor:
                      Color.fromRGBO(255, 255, 255, 0.31),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 2.0),
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          size: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  top: 57,
                  left: 22,
                ),
                Positioned(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 120, 0, 0),
                    child: Text(
                      'Support',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 170, 0, 0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40),
                        topLeft: Radius.circular(40),
                      ),
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    width: 450,
                    height: 647.2856,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(23, 31, 24, 0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    //maxLength: 50,
                                    decoration: InputDecoration(
                                        labelText: "  First Name",
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  241, 241, 241, 1),
                                              width: 2)),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.grey, width: 2)),),
                                    onSaved: (First_Name) {
                                      print("First Name: '$First_Name'");
                                    },
                                    validator: (First_Name) {
                                      var regex = RegExp(r"^[A-Za-z]");
                                      if (First_Name!.isEmpty) {
                                        return 'Please enter First Name';
                                      } else {
                                        if (!regex.hasMatch(First_Name)) {
                                          return 'Enter valid First Name';
                                        } else {
                                          return null;
                                        }
                                      }
                                    },
                                  ),
                                ),
                                SizedBox(width: 16.0),
                                Expanded(
                                  child: TextFormField(
                                    keyboardType: TextInputType.name,
                                    //maxLength: 50,
                                    decoration:
                                        InputDecoration(labelText: "  Last Name",
                                          enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Color.fromRGBO(
                                                      241, 241, 241, 1),
                                                  width: 2)),
                                          focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.grey, width: 2)),),
                                    onSaved: (Last_Name) {
                                      print("Last Name: '$Last_Name'");
                                    },
                                    validator: (Last_Name) {
                                      var regex = RegExp(r"^[A-Za-z]");
                                      if (Last_Name!.isEmpty) {
                                        return 'Please enter Last Name';
                                      } else {
                                        if (!regex.hasMatch(Last_Name)) {
                                          return 'Enter valid Last Name';
                                        } else {
                                          return null;
                                        }
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(23, 18, 24, 0),
                            child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                //maxLength: 50,
                                decoration: InputDecoration(labelText: "  Email",
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Color.fromRGBO(
                                            241, 241, 241, 1),
                                        width: 2)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 2)),),

                                onSaved: (Email) {
                                  print("Email: '$Email'");
                                },
                                validator: (Email) {
                                  var regex = RegExp(
                                      r"^[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+$");
                                  if (Email!.isEmpty) {
                                    return 'Please enter Email';
                                  } else {
                                    if (!regex.hasMatch(Email)) {
                                      return 'Enter valid Email';
                                    } else {
                                      return null;
                                    }
                                  }
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(23, 18, 24, 0),
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              //maxLength: 50,
                              decoration: InputDecoration(labelText: "  Massage"),
                              onSaved: (massage) {
                                print("Massage: '$massage'");
                              },
                            ),
                          ),
                          SizedBox(
                            height: 18.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child: FloatingActionButton.extended(
                              onPressed: () {
                                final currentState = fromkey.currentState;
                                if (currentState != null &&
                                    currentState.validate()) {
                                  currentState.save();
                                }
                                Navigator.pop(context);
                              },
                              backgroundColor: Color.fromRGBO(195, 253, 8, 1),
                              label: Padding(
                                padding: const EdgeInsets.all(135.0),
                                child: Text("Send",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Color.fromRGBO(0, 0, 0, 1))),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
