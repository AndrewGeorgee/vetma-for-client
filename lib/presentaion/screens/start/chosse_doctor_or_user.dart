import 'package:flutter/material.dart';
import 'package:vetma_final_project/presentaion/screens/bottom_screen/home_screen.dart';

import '../../widget/bottom_with_backgraund.dart';
import '../auth/login_page.dart';
import '../doctor_app/auth/login_docotor.dart';


import 'get_start_pages.dart';

class SelectUSerOrDoctor extends StatelessWidget {
  const SelectUSerOrDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
            child: Container(
          width: 400,
          height: 280,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1.5,
                  blurRadius: 5,
                ),
              ],
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(25))),
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const GetStart())),
                            icon: const Icon(Icons.arrow_back_rounded)),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 95),
                          child: Text(
                            'Sign in as ',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //! user app
                  BottomWithBackgraund2(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScrren()));
                    },
                    text: 'U S E R',
                  ),

                  //! doctor app
                  BottomWithBackgraund2(
                    onPressed: () {
                      navigateTo(context,  LoginOfUser());
                    },
                    text: 'D O C T O R',
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}
