import 'package:flutter/material.dart';
import 'package:vetma_final_project/core/resources/assets_manger.dart';

import '../../widget/Bottom_without_back.dart';
import 'chosse_doctor_or_user.dart';

class GetStart extends StatelessWidget {
  const GetStart({super.key});

  @override
  Widget build(BuildContext context) {
    // ! BackGround Screen
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AssetsManager.backRoud),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1.5,
                    blurRadius: 5,
                  ),
                ],
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
              width: double.infinity,
              height: 500,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  children: [
                    Container(
                      width: 70,
                      height: 3.5,
                      decoration: BoxDecoration(
                        color: Colors.grey[400],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(
                      height: 35,
                    ),
                    // ! LOGO IMAGE
                    SizedBox(
                      width: 300,
                      height: 100,
                      child: Image.asset(
                        AssetsManager.logo,
                        fit: BoxFit.cover,
                      ),
                    ),

                    // ? Intro Text
                    const Text(
                      'Vetma is a mobile application that makes it\n'
                      ' easy for you to reach for an experienced\n'
                      'veterinarian doctor to make an appointment \n'
                      'with a few clicks.Vetma also includes much\n'
                      ' advice on how to care for your pet better.\n',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    // ! Get Started
                    BottomWithOutBackgraund(
                        text: 'Get Started',
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (Contect) =>
                                      const SelectUSerOrDoctor()));
                        }),
                    const Spacer(),
                    Image.asset(
                      AssetsManager.vet,
                      fit: BoxFit.cover,
                    ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
