import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:yourpadel/presentation_layer/resources/icons_app.dart';
import 'package:yourpadel/presentation_layer/screens/Navigation_screen/Cubit.dart';
import 'package:yourpadel/presentation_layer/screens/Navigation_screen/States.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreen();
}

class _NavigationScreen extends State<NavigationScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocConsumer<NavigationCubit, NavigationStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var navigationCubit = NavigationCubit.get(context);
          return Scaffold(
            body: navigationCubit.bottomScreens[navigationCubit.currentIndex],
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (selectedIndex == 0)
                    TabIndicators(
                      activeIdx: selectedIndex,
                      activeColor: Color.fromRGBO(34, 99, 227, 1),
                      numTabs: 5,
                      padding: 20,
                      height: 4,
                      width: 70,
                    ),
                  if (selectedIndex == 1)
                    TabIndicators(
                      activeIdx: selectedIndex,
                      activeColor: Color.fromRGBO(34, 99, 227, 1),
                      numTabs: 5,
                      padding: 5,
                      height: 4,
                      width: 76,
                    ),
                  if (selectedIndex == 2)
                    TabIndicators(
                      activeIdx: selectedIndex,
                      activeColor: Color.fromRGBO(34, 99, 227, 1),
                      numTabs: 5,
                      padding: 5,
                      height: 4,
                      width: 76,
                    ),
                  if (selectedIndex == 3)
                    TabIndicators(
                      activeIdx: selectedIndex,
                      activeColor: Color.fromRGBO(34, 99, 227, 1),
                      numTabs: 5,
                      padding: 20,
                      height: 4,
                      width: 70,
                    ),
                  if (selectedIndex == 4)
                    TabIndicators(
                      activeIdx: selectedIndex,
                      activeColor: Color.fromRGBO(34, 99, 227, 1),
                      numTabs: 5,
                      padding: 20,
                      height: 4,
                      width: 70,
                    ),
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: const Color.fromARGB(255, 223, 217, 217),
                          width: 1,
                        ),
                      ),
                    ),
                    child: ClipRRect(
                      child: SalomonBottomBar(
                        onTap: (index) {
                          navigationCubit.changeBottom(index);
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        currentIndex: selectedIndex,
                        selectedItemColor: Color.fromRGBO(255, 255, 255, 1),
                        backgroundColor: Colors.white,
                        items: [
                          SalomonBottomBarItem(
                            icon: Icon(
                              Icons_app.doc,
                              size: 22,
                              color: selectedIndex == 0
                                  ? Color.fromRGBO(34, 99, 227, 1)
                                  : Color.fromRGBO(130, 130, 130, 1),
                            ),
                            title: Text("News",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                )),
                          ),
                          SalomonBottomBarItem(
                            icon: Icon(
                              Icons_app.reservations_icon,
                              size: 22,
                              color: selectedIndex == 1
                                  ? Color.fromRGBO(34, 99, 227, 1)
                                  : Color.fromRGBO(130, 130, 130, 1),
                            ),
                            title: Text("Reservations",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                )),
                          ),
                          SalomonBottomBarItem(
                            icon: Icon(
                              Icons_app.reserve_icon,
                              size: 22,
                              color: selectedIndex == 2
                                  ? Color.fromRGBO(34, 99, 227, 1)
                                  : Color.fromRGBO(130, 130, 130, 1),
                            ),
                            title: Text("Reserve",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                )),
                          ),
                          SalomonBottomBarItem(
                              icon: Icon(
                                Icons_app.about_icon,
                                size: 22,
                                color: selectedIndex == 3
                                    ? Color.fromRGBO(34, 99, 227, 1)
                                    : Color.fromRGBO(130, 130, 130, 1),
                              ),
                              title: Text("About",
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.black,
                                  ))),
                          SalomonBottomBarItem(
                            icon: Icon(
                              Icons_app.profile_icon,
                              size: 22,
                              color: selectedIndex == 4
                                  ? Color.fromRGBO(34, 99, 227, 1)
                                  : Color.fromRGBO(130, 130, 130, 1),
                            ),
                            title: Text("Profile",
                                style: TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class TabIndicators extends StatelessWidget {
  final int numTabs;
  final int activeIdx;
  final Color activeColor;
  final double padding;
  final double height;
  final double width;

  const TabIndicators({
    required this.numTabs,
    required this.activeIdx,
    required this.activeColor,
    required this.padding,
    required this.height,
    required this.width,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          numTabs,
          (index) => Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: index == activeIdx ? activeColor : Colors.transparent,
            ),
          ),
        ),
      ),
    );
  }
}