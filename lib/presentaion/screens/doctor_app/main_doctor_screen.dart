import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:vetma_final_project/presentaion/cubit/doctor_app_cubit/doctor_cubit.dart';

import '../../../core/resources/assets_manger.dart';
import '../../../core/resources/colors.dart';
import '../../../core/resources/icon_broken.dart';
import 'appointment_doctor_screen.dart';
import 'doctor_profile.dart';

class MainScreenDctor extends StatefulWidget {
  const MainScreenDctor({super.key});

  @override
  State<MainScreenDctor> createState() => _MainScreenDctorState();
}

class _MainScreenDctorState extends State<MainScreenDctor> {
  int _currentIndex = 0;
  List screenBottomNav = [
    DoctorAppointment(),
    const DoctorProfile(),
  ];
  void changeScreenBottom(int index) {
    setState(() {
      _currentIndex = index;
      if (index == 0) DoctorAppointment();
      if (index == 1) const DoctorProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AssetsManager.profile),
            fit: BoxFit.cover,
          ),
        ),
        child: StreamBuilder(
            stream: DoctorCubit.get(context)
                .getDoctorDataStream(FirebaseAuth.instance.currentUser!.uid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
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
                          GButton(
                            curve: Curves.bounceInOut,
                            icon: IconBroken.Home,
                            text: 'Home',
                            //  textSize: 20,
                            textStyle: TextStyle(
                                fontSize: 20,
                                color: ColorManager.prymaryColor,
                                fontWeight: FontWeight.bold),
                          ),
                          GButton(
                            icon: IconBroken.Profile,
                            text: 'Profile',
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
            }));
  }
}
