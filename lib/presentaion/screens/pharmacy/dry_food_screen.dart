import 'package:flutter/material.dart';
import 'package:vetma_final_project/core/resources/colors.dart';
import 'package:vetma_final_project/presentaion/screens/bottom_screen/home_screen.dart';
import 'package:vetma_final_project/presentaion/screens/pharmacy/pharmacy_screen.dart';

import '../../../core/resources/assets_manger.dart';

class DryFoodScreen extends StatelessWidget {
  const DryFoodScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              AssetsManager.pharmacyBackGround,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              IconButton(
                onPressed: () {
                  navigateTo(context, const PharmacyScreen());
                },
                icon: const Icon(
                  Icons.chevron_left_sharp,
                  color: Colors.black,
                  size: 40,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(30.0),
                child: Text(
                  'Dry Foods for cats',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                ),
              ),
              //!Dry Food kinds
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
                              height: 5,
                            ),
                            const Text(
                              '       Birbo - \nDry Food for Cats',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '135 LE',
                              style:
                                  TextStyle(color: ColorManager.prymaryColor),
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
                                child: Image.asset(AssetsManager.m2)),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '       1KG Vita\nday CAT DRY FOOD',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '200 LE',
                              style:
                                  TextStyle(color: ColorManager.prymaryColor),
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
                      height: 220,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 150,
                                height: 150,
                                child: Image.asset(AssetsManager.m3)),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '    Blacky dry food \n    for cats - 20KG',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              '1890  LE',
                              style:
                                  TextStyle(color: ColorManager.prymaryColor),
                            ),
                          ]),
                    )),
                    Expanded(
                        child: SizedBox(
                      width: 200,
                      height: 220,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 150,
                                height: 150,
                                child: Image.asset(AssetsManager.m4)),
                            const SizedBox(
                              height: 5,
                            ),
                            const Text(
                              '    Dupy Cats Dry \n     Food - 20Kg',
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              ' 1700 LE',
                              style:
                                  TextStyle(color: ColorManager.prymaryColor),
                            ),
                          ]),
                    )),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}
