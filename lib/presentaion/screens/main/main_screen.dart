import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vetma_final_project/core/resources/colors.dart';
import 'package:vetma_final_project/core/resources/icon_broken.dart';
import 'package:vetma_final_project/presentaion/screens/bottom_screen/ai.dart';
import '../../cubit/user_cubit/user_cubit.dart';
import '../bottom_screen/home_screen.dart';
import '../bottom_screen/notification_screen.dart';
import '../bottom_screen/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  List screenBottomNav = [
    const HomeScreenBottomNav(),
    const NotificationScreenBottomNav(),
    const AIScreen(),
    const ProfileScreenBottomNav(),
  ];
  void changeScreenBottom(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 1) const NotificationScreenBottomNav();
      if (index == 2) const AIScreen();
      if (index == 3) const ProfileScreenBottomNav();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('MainScreen');

    return Container(
      color: Colors.white,
      
      child: StreamBuilder(
          stream: UserCubit.get(context)
              .getUserDataStream(FirebaseAuth.instance.currentUser!.uid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              //  final user = snapshot.data;
              return SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: screenBottomNav[_currentIndex],
                  bottomNavigationBar: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 1.5,
                          blurRadius: 5,
                          //offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: GNav(
                      selectedIndex: _currentIndex,
                      onTabChange: (index) {
                        setState(() {
                          changeScreenBottom(index);
                          print('Screen  $index');
                        });
                      },
                      gap: 8,
                      activeColor: ColorManager.prymaryColor,
                      tabs: [
                        //! Home Screen
                        GButton(
                          icon: IconBroken.Home,
                          text: '',
                          //  textSize: 20,
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: ColorManager.prymaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        //!  Notification Screen
                        GButton(
                          icon: IconBroken.Notification,
                          text: '',

                          textStyle: TextStyle(
                              fontSize: 20,
                              color: ColorManager.prymaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        GButton(
                          icon: Icons.chat,
                          text: '',
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: ColorManager.prymaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                        //! Profile Screen
                        GButton(
                          icon: IconBroken.User,
                          text: '',
                          textStyle: TextStyle(
                              fontSize: 20,
                              color: ColorManager.prymaryColor,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
