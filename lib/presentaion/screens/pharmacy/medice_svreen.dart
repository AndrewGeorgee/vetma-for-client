import 'package:flutter/material.dart';

import '../../../core/resources/assets_manger.dart';
import '../../../core/resources/colors.dart';
import '../../../core/resources/routes_manager.dart';

class MediceScreen extends StatelessWidget {
  const MediceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  AssetsManager.pharmacyBackGround,
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Scaffold(
                backgroundColor: Colors.transparent,
                body: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(
                            context, Routes.pharmacyRoutes);
                      },
                      icon: const Icon(
                        Icons.chevron_left_sharp,
                        color: Colors.black,
                        size: 40,
                      ),
                    ),
                    //! Medicine of cat 
                    const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Text(
                        'Medicine for cats',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                            width: 200,
                            height: 250,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: Image.asset(AssetsManager.r1)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Revolution\n  for Cats',
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    ' 1490 LE',
                                    style: TextStyle(
                                        color: ColorManager.prymaryColor),
                                  ),
                                ]),
                          )),
                          Expanded(
                              child: SizedBox(
                            width: 200,
                            height: 250,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: Image.asset(AssetsManager.r2)),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  const Text(
                                    'Durnal Cat\n  Tablets',
                                  ),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  Text(
                                    '200 LE',
                                    style: TextStyle(
                                        color: ColorManager.prymaryColor),
                                  ),
                                ]),
                          )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: SizedBox(
                            width: 200,
                            height: 250,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: Image.asset(AssetsManager.m1)),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text(
                                    '  FRONTLINE \n Plus For Cats',
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '70 LE',
                                    style: TextStyle(
                                        color: ColorManager.prymaryColor),
                                  ),
                                ]),
                          )),
                          Expanded(
                              child: SizedBox(
                            width: 200,
                            height: 250,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: 150,
                                      height: 150,
                                      child: Image.asset(AssetsManager.r4)),
                                  const SizedBox(
                                    height: 2,
                                  ),
                                  const Text(
                                    ' Omni Guard\n',
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '120 LE',
                                    style: TextStyle(
                                        color: ColorManager.prymaryColor),
                                  ),
                                ]),
                          )),
                        ],
                      ),
                    ),
                  ],
                ))));
  }
}
