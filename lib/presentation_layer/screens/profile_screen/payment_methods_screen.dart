import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class PaymentMethodsScreen extends StatefulWidget {
  const PaymentMethodsScreen({super.key});

  @override
  State<PaymentMethodsScreen> createState() => _PaymentMethodsScreen();
}

enum SingingCharacter {Cash, Credit_Debit_Card }

class _PaymentMethodsScreen extends State<PaymentMethodsScreen> {
  SingingCharacter? _character = SingingCharacter.Cash;
  bool light1 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
          print('snapshot ${snapshot.toString()}');
          if (snapshot.hasData) {
            ConnectivityResult? result = snapshot.data;
            if (result == ConnectivityResult.wifi ||
                result == ConnectivityResult.mobile) {
              return Container(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Image.asset(
                        'assets/images/background.png',
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                      Image.asset(
                        'assets/images/header_color.png',
                        height: 300,
                        fit: BoxFit.cover,
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
                              padding: EdgeInsets.only(right: 2.0),
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
                        child: Text(
                          'Payment Methods ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.w500),
                        ),
                        top: 129,
                        left: 22,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 175.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40)),
                            color: Colors.white,
                          ),
                          height: 932,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 23),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color:
                                              Color.fromRGBO(250, 250, 250, 1),
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color:
                                              Color.fromRGBO(250, 250, 250, 1),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            title: Text('Cash'),
                                            onTap: () {
                                            },
                                            trailing: Radio<SingingCharacter>(
                                              value: SingingCharacter.Cash,
                                              groupValue: _character,
                                              activeColor: Color.fromRGBO(
                                                  34, 99, 227, 1),
                                              onChanged:
                                                  (SingingCharacter? value) {
                                                setState(() {
                                                  _character = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color:
                                              Color.fromRGBO(250, 250, 250, 1),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: ListTile(
                                            contentPadding: EdgeInsets.zero,
                                            title: Text('Credit - Debit Card'),
                                            onTap: () {

                                            },
                                            trailing: SizedBox(
                                              child: Radio<SingingCharacter>(
                                                value: SingingCharacter
                                                    .Credit_Debit_Card,
                                                groupValue: _character,
                                                activeColor: Color.fromRGBO(
                                                    34, 99, 227, 1),
                                                onChanged:
                                                    (SingingCharacter? value) {
                                                  setState(() {
                                                    _character = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 383,
                                  height: 60,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        surfaceTintColor: Colors.white,
                                        shadowColor: Colors.white,
                                        backgroundColor:
                                            Color.fromRGBO(255, 255, 255, 1),
                                        foregroundColor: Colors.white,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            side: BorderSide(
                                                color: Color.fromRGBO(
                                                    34, 99, 227, 1)))),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text(
                                      "Save",
                                      style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ));
            } else {
              return buildMissConnection();
            }
          } else {
            return Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    Image.asset(
                      'assets/images/background.png',
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                    Image.asset(
                      'assets/images/header_color.png',
                      height: 300,
                      fit: BoxFit.cover,
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
                            padding: EdgeInsets.only(right: 2.0),
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
                      child: Text(
                        'Payment Methods ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500),
                      ),
                      top: 129,
                      left: 22,
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 175.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40)),
                          color: Colors.white,
                        ),
                        height: 932,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 23),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(16),
                                        color:
                                        Color.fromRGBO(250, 250, 250, 1),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(16),
                                        color:
                                        Color.fromRGBO(250, 250, 250, 1),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          title: Text('Cash'),
                                          onTap: () {
                                          },
                                          trailing: Radio<SingingCharacter>(
                                            value: SingingCharacter.Cash,
                                            groupValue: _character,
                                            activeColor: Color.fromRGBO(
                                                34, 99, 227, 1),
                                            onChanged:
                                                (SingingCharacter? value) {
                                              setState(() {
                                                _character = value;
                                              });
                                            },
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(16),
                                        color:
                                        Color.fromRGBO(250, 250, 250, 1),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          title: Text('Credit - Debit Card'),
                                          onTap: () {
                                          },
                                          trailing: SizedBox(
                                            child: Radio<SingingCharacter>(
                                              value: SingingCharacter
                                                  .Credit_Debit_Card,
                                              groupValue: _character,
                                              activeColor: Color.fromRGBO(
                                                  34, 99, 227, 1),
                                              onChanged:
                                                  (SingingCharacter? value) {
                                                setState(() {
                                                  _character = value;
                                                });
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 383,
                                height: 60,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      surfaceTintColor: Colors.white,
                                      shadowColor: Colors.white,
                                      backgroundColor:
                                      Color.fromRGBO(255, 255, 255, 1),
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(100),
                                          side: BorderSide(
                                              color: Color.fromRGBO(
                                                  34, 99, 227, 1)))),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    "Save",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ));
          }
        },
      ),
    );
  }

  Future buildBottomSheet() => showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      context: context,
      builder: (context) {
        return Container(
          width: 430,
          height: 702,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/miss_connection.png'),
                    Text(
                      'No internet connection',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Text(
                        'Failed to connect to Your Padel , please check your device’s network connection.',
                        maxLines: 3,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      });
  Widget buildMissConnection() => SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset('assets/images/background.png'),
                Image.asset('assets/images/background_color.png'),
                Positioned(
                    child: Image.asset('assets/images/racket.png'),
                    top: 66,
                    left: 189.27),
                Positioned(
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundColor: Color.fromRGBO(255, 255, 255, 0.31),
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
                Padding(
                  padding: const EdgeInsets.only(top: 130.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40),
                          topLeft: Radius.circular(40)),
                      color: Colors.white,
                    ),
                    height: 702,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Center(
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/images/miss_connection.png'),
                              Text(
                                'No internet connection',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Text(
                                  'Failed to connect to Your Padel , please check your device’s network connection.',
                                  maxLines: 3,
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      );
}
