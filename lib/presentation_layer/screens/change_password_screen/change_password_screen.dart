import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreen();
}

class _ChangePasswordScreen extends State<ChangePasswordScreen> {
var OldPasswordController = TextEditingController();
var NewpasswordController = TextEditingController();
  bool isOldPassword=false;
  bool isPassword=false;
  bool isRePassword=false;  
  final user = FirebaseAuth.instance.currentUser!;
  var auth = FirebaseAuth.instance;
  var currentUser = FirebaseAuth.instance.currentUser;
  Future changePass (email, oldPassword, newPassword) async{
    try {
      var cred = EmailAuthProvider.credential(email: email, password: oldPassword);
      await currentUser!.reauthenticateWithCredential(cred).then((value){
        currentUser!.updatePassword(newPassword);
      });
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text("Password Changed"),
        );
      });
      
    } on FirebaseAuthException catch (e){
      print(e);
      showDialog(context: context, builder: (context){
        return AlertDialog(
          content: Text(e.message.toString()),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Connectivity().onConnectivityChanged,
        builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
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
                        child: Text(
                          'Change Password',
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
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(40),
                                topLeft: Radius.circular(40)),
                            color: Colors.white,
                          ),
                          height: 932,
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 23),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          controller: OldPasswordController,
                                          cursorColor: Colors.grey,
                                          obscureText: !isOldPassword,//This will obscure text dynamically
                                          keyboardType: TextInputType.visiblePassword,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'please enter old Password';
                                            }
                                          },
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.lock_open_sharp,
                                                color: Color.fromRGBO(
                                                    181, 181, 181, 1),
                                                size: 30,
                                              ),
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  // Based on passwordVisible state choose the icon
                                                    isOldPassword
                                                        ? Icons.visibility_outlined
                                                        : Icons.visibility_off_outlined,
                                                    color: Color.fromRGBO(
                                                        181, 181, 181, 1)
                                                ),
                                                onPressed: () {
                                                  // Update the state i.e. toogle the state of passwordVisible variable
                                                  setState(() {
                                                    isOldPassword = !isOldPassword;
                                                  });
                                                },
                                              ),
                                              border: UnderlineInputBorder(),
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          241, 241, 241, 1),
                                                      width: 2)),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1)),
                                              labelText: "Old Password",
                                              labelStyle: TextStyle(
                                                  color: Color.fromRGBO(
                                                      181, 181, 181, 1))),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          controller: NewpasswordController,
                                          cursorColor: Colors.grey,
                                          obscureText: !isPassword,//This will obscure text dynamically
                                          keyboardType: TextInputType.visiblePassword,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'please enter New Password';
                                            }
                                          },
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.lock_open_sharp,
                                                color: Color.fromRGBO(
                                                    181, 181, 181, 1),
                                                size: 30,
                                              ),
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  // Based on passwordVisible state choose the icon
                                                    isPassword
                                                        ? Icons.visibility_outlined
                                                        : Icons.visibility_off_outlined,
                                                    color: Color.fromRGBO(
                                                        181, 181, 181, 1)
                                                ),
                                                onPressed: () {
                                                  // Update the state i.e. toogle the state of passwordVisible variable
                                                  setState(() {
                                                    isPassword = !isPassword;
                                                  });
                                                },
                                              ),
                                              border: UnderlineInputBorder(),
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          241, 241, 241, 1),
                                                      width: 2)),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1)),
                                              labelText: "New Password",
                                              labelStyle: TextStyle(
                                                  color: Color.fromRGBO(
                                                      181, 181, 181, 1))),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        TextFormField(
                                          cursorColor: Colors.grey,
                                          obscureText: !isRePassword,//This will obscure text dynamically
                                          keyboardType: TextInputType.visiblePassword,
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return 'please enter Password Again';
                                              }
                                              if(value != NewpasswordController.text)
                                              {
                                                return 'confirm password Not Match';
                                              }
                                            },
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.lock_open_sharp,
                                                color: Color.fromRGBO(
                                                    181, 181, 181, 1),
                                                size: 30,
                                              ),
                                              suffixIcon: IconButton(
                                                icon: Icon(
                                                  // Based on passwordVisible state choose the icon
                                                    isRePassword
                                                        ? Icons.visibility_outlined
                                                        : Icons.visibility_off_outlined,
                                                    color: Color.fromRGBO(
                                                        181, 181, 181, 1)
                                                ),
                                                onPressed: () {
                                                  // Update the state i.e. toogle the state of passwordVisible variable
                                                  setState(() {
                                                    isRePassword = !isRePassword;
                                                  });
                                                },
                                              ),

                                              border: UnderlineInputBorder(),
                                              enabledBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color.fromRGBO(
                                                          241, 241, 241, 1),
                                                      width: 2)),
                                              focusedBorder: UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.grey,
                                                      width: 1)),
                                              labelText: "Confirm New Password",
                                              labelStyle: TextStyle(
                                                  color: Color.fromRGBO(
                                                      181, 181, 181, 1))),
                                        ),
                                      ],
                                    ),
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
                                    onPressed: () async {
                                      await changePass(user.email!, OldPasswordController.text, NewpasswordController.text);
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
                      child: Text(
                        'Change Password',
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
                        decoration:  BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40)),
                          color: Colors.white,
                        ),
                        height: 932,
                        child: Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 23),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: OldPasswordController,
                                        cursorColor: Colors.grey,
                                        obscureText: !isOldPassword,//This will obscure text dynamically
                                        keyboardType: TextInputType.visiblePassword,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'please enter old Password';
                                          }
                                        },
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.lock_open_sharp,
                                              color: Color.fromRGBO(
                                                  181, 181, 181, 1),
                                              size: 30,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                // Based on passwordVisible state choose the icon
                                                  isOldPassword
                                                      ? Icons.visibility_outlined
                                                      : Icons.visibility_off_outlined,
                                                  color: Color.fromRGBO(
                                                      181, 181, 181, 1)
                                              ),
                                              onPressed: () {
                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                setState(() {
                                                  isOldPassword = !isOldPassword;
                                                });
                                              },
                                            ),
                                            border: UnderlineInputBorder(),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        241, 241, 241, 1),
                                                    width: 2)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1)),
                                            labelText: "Old Password",
                                            labelStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    181, 181, 181, 1))),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        controller: NewpasswordController,
                                        cursorColor: Colors.grey,
                                        obscureText: !isPassword,//This will obscure text dynamically
                                        keyboardType: TextInputType.visiblePassword,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'please enter New Password';
                                          }
                                        },
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.lock_open_sharp,
                                              color: Color.fromRGBO(
                                                  181, 181, 181, 1),
                                              size: 30,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                // Based on passwordVisible state choose the icon
                                                  isPassword
                                                      ? Icons.visibility_outlined
                                                      : Icons.visibility_off_outlined,
                                                  color: Color.fromRGBO(
                                                      181, 181, 181, 1)
                                              ),
                                              onPressed: () {
                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                setState(() {
                                                  isPassword = !isPassword;
                                                });
                                              },
                                            ),
                                            border: UnderlineInputBorder(),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        241, 241, 241, 1),
                                                    width: 2)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1)),
                                            labelText: "New Password",
                                            labelStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    181, 181, 181, 1))),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      TextFormField(
                                        cursorColor: Colors.grey,
                                        obscureText: !isRePassword,//This will obscure text dynamically
                                        keyboardType: TextInputType.visiblePassword,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return 'please enter Password Again';
                                          }
                                          if(value != NewpasswordController.text)
                                          {
                                            return 'confirm password Not Match';
                                          }
                                        },
                                        decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.lock_open_sharp,
                                              color: Color.fromRGBO(
                                                  181, 181, 181, 1),
                                              size: 30,
                                            ),
                                            suffixIcon: IconButton(
                                              icon: Icon(
                                                // Based on passwordVisible state choose the icon
                                                  isRePassword
                                                      ? Icons.visibility_outlined
                                                      : Icons.visibility_off_outlined,
                                                  color: Color.fromRGBO(
                                                      181, 181, 181, 1)
                                              ),
                                              onPressed: () {
                                                // Update the state i.e. toogle the state of passwordVisible variable
                                                setState(() {
                                                  isRePassword = !isRePassword;
                                                });
                                              },
                                            ),

                                            border: UnderlineInputBorder(),
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color.fromRGBO(
                                                        241, 241, 241, 1),
                                                    width: 2)),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.grey,
                                                    width: 1)),
                                            labelText: "Confirm New Password",
                                            labelStyle: TextStyle(
                                                color: Color.fromRGBO(
                                                    181, 181, 181, 1))),
                                      ),
                                    ],
                                  ),
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
                                  onPressed: () async {
                                      await changePass(user.email!, OldPasswordController.text, NewpasswordController.text);
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
                        'Failed to connect to Padel Up Mirage City , please check your device’s network connection.',
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
                              'Failed to connect to Padel Up Mirage City , please check your device’s network connection.',
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
